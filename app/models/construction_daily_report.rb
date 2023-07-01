class ConstructionDailyReport < ApplicationRecord
  
  #demo版対応
  MAX_RECORD_COUNT = 5
  
  paginates_per 200  # 1ページあたり項目表示
  
  #belongs_to :construction_datum, :touch => :construction_start_date
  belongs_to :construction_datum, optional: true
  accepts_nested_attributes_for :construction_datum, update_only: true
  #attr_accessor :construction_datum
  
  #has_many :Staffs
  belongs_to :Staff, optional: true, :foreign_key => "staff_id"  
  
  #みなし勤務判定用
  attr_accessor :regard_one_day
  attr_accessor :regard_half_day
  
  #休日フラグ
  attr_accessor :holiday_flag
  
  #労務費（加算なしのもの--後で消す？）
  attr_accessor :labor_cost_no_add
  
  #所属
  attr_accessor :affiliation
  
  #
  
  #作業時間--ajax計算用--標準仕様
  attr_accessor :working_hour #就業時間
  
  #就業時間
  attr_accessor :working_time_start_time
  attr_accessor :working_time_end_time
  
  #
  attr_accessor :break_time_1_start_time
  attr_accessor :break_time_1_end_time
  attr_accessor :break_time_2_start_time
  attr_accessor :break_time_2_end_time
  attr_accessor :break_time_3_start_time
  attr_accessor :break_time_3_end_time
  
  #早出時間
  attr_accessor :overtime_early_start_time
  attr_accessor :overtime_early_end_time
  
  #残業時間
  attr_accessor :overtime_start_time
  attr_accessor :overtime_end_time
  
  #深夜残業時間
  attr_accessor :overtime_midnight_start_time
  attr_accessor :overtime_midnight_end_time
  #
  
  #validation
  validates :working_date, presence: true
  validates :staff_id, presence: true
  validates :working_details, presence: true
  
  #validates :construction_datum_id, presence: true
  # 数値であり、0以上の場合有効
  validates :working_times, numericality: {
            only_integer: true, greater_than_or_equal_to: 0
          }
  
  #作業日＆時間の重複登録防止
  validates :construction_datum_id,  presence: true, uniqueness: { scope: [:working_date, :staff_id, :start_time_1, :end_time_1] }
  
  #demo版対応
  validate :construction_daily_count_must_be_within_limit, on: :create
  
  #入力チェック(日またがりで計算がおかしくなるのを防止)
  # ↑ 計算異常を修正したので下記は未使用にした
  #validate :time_too_large
  
  
  #scope
  scope :with_construction, -> (construction_daily_reports_construction_datum_id=1) { joins(:construction_datum).where("construction_data.id = ?", construction_daily_reports_construction_datum_id )}

 # scope :with_staff, -> (construction_daily_reports_staff_id=1) { joins(:Staffs).where("Staffs.id = ?", construction_daily_reports_staff_id )}


  def self.ransackable_scopes(auth_object=nil)
  		[:with_construction]
  end

  
  #demo版対応
  def construction_daily_count_must_be_within_limit
    errors.add(:base, "デモ版は#{MAX_RECORD_COUNT}件しか登録できません") if ConstructionDailyReport.count >= MAX_RECORD_COUNT
  end
    
   #入力チェック用
   def time_too_large
     #22:00~4:00のように入力すると計算がおかしくなるため、２行に入力させるため警告する
     if end_time_1.to_s(:time) != "00:00"
       if start_time_1 > end_time_1
         errors.add(:time1, ": 日またがりの場合は、０時以降を時間２へ入力してくだい。")
       end
     end
   end
   
   #労務費合計
   def self.sumprice  
    	sum(:labor_cost)
    	#User.sumでもかまいません
    	#カラム名(フィールド名)は大文字使ってもいいですが、普通小文字の方がよいです
   end
   #作業時間合計
   def self.sumtimes  
    	sum = sum(:working_times)
		if sum.present?
		  sum = sum / 3600
		end
    	#User.sumでもかまいません
    	#カラム名(フィールド名)は大文字使ってもいいですが、普通小文字の方がよいです
   end

    #以下、全てcsv用
   def self.to_csv(options = {})
      CSV.generate do |csv|
        csv << ["working_date", "staff_id",  "man_month", "labor_cost", "construction_code", "construction_name" ]
		all.order('working_date').each do |construction_daily_reports|
          csv << construction_daily_reports.csv_column_values
		end
          #this doesnt work
          #csv.sort_by{ |csv_column_values| csv_column_values[1]}
      end
      
    end
	
	def csv_column_headers
	  ["working_date", "staff_id",  "man_month", "labor_cost", "construction_code", "construction_name" ]
	end
	def csv_column_values
      # [working_date.strftime("%Y/%m/%d") , staff_id, man_month, labor_cost,   construction_datum.construction_code, construction_datum.construction_name ]
	  [working_date.strftime("%m/%d") , staff_id, man_month, labor_cost,   construction_datum.construction_code, construction_datum.construction_name ]
    end
	# def material_code
	#   MaterialMaster.where("id = ?", material_id).pluck(:material_code).flatten.join(" ")
	# end
	# def customer_name
	#  CustomerMaster.where("id = ?", construction_datum.customer_id).pluck(:customer_name).flatten.join(" ")
	# end
   # ここまで
  def self.ransackable_attributes(auth_object = nil)
    ["construction_datum_id", "created_at", "end_time_1", "end_time_2", "id", "is_no_break_time_1", "is_no_break_time_2", "is_no_break_time_3", "is_one_day_work", "labor_cost", "man_month", "staff_id", "start_time_1", "start_time_2", "updated_at", "working_date", "working_details", "working_times"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["Staff", "construction_datum"]
  end

end
