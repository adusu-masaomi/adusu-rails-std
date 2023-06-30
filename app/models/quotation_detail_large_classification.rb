class QuotationDetailLargeClassification < ApplicationRecord
  belongs_to :QuotationHeader, :foreign_key => "quotation_header_id"
  belongs_to :WorkingUnit, :foreign_key => "working_unit_id"
  has_many :quotation_detail_middle_classifications

  def self.choices 
    [["項目", 1], ["備考", 2]] 
  end
  
  def self.serial_number
    [[("<行選択>").to_s , (1..999).to_a ]]
  end 
  
  #行挿入用
  attr_accessor :check_line_insert
  #マスターセット用
  attr_accessor :check_update_item
  attr_accessor :check_update_all
  
  #短縮名手入力用
  attr_accessor :working_large_item_short_name_manual
  
  attr_accessor :quotation_large_item_id
  attr_accessor :master_insert_flag
  
  #ajax用（リスト）
  
  attr_accessor :working_middle_item_id_select_hide
  attr_accessor :working_middle_item_short_name_select_hide
  attr_accessor :working_subcategory_select_hide
  attr_accessor :category_save_flag_child
  #
  
  #add180803
  #確定済みのバリデーション
  #とりあえずここで必要ないので保留中・・
  #validate :check_fixed
  #def check_fixed
  #  if  self.QuotationHeader.fixed_flag ==  1
  #      errors.add(:quotation_code, ": 確定済みです。変更したい場合は、" << 
  #        "　　　　　　　　" << "「確定済み」のチェックを外してください。")
  #  end
  #end
  
  #金額合計(見積)
  def self.sumpriceQuote  
    #工事種別が通常かまたは値引の場合のみ合算。
    #where("construction_type = ? or construction_type = ? ", "0", $INDEX_DISCOUNT.to_s ).sum(:quote_price)
    
    #工事種別が小計以外は加算する
    where("construction_type <> ? ", $INDEX_SUBTOTAL.to_s ).sum(:quote_price)
    #where("construction_type <> ? ", $INDEX_SUBTOTAL.to_s ).pluck(:quote_price).sum
  end
  #金額合計(実行)
  def self.sumpriceExecution  
    #工事種別が通常かまたは値引の場合のみ合算。
    #where("construction_type = ? or construction_type = ? ", "0", $INDEX_DISCOUNT.to_s ).sum(:execution_price)
	
	#工事種別が小計以外は加算する
    where("construction_type <> ? ", $INDEX_SUBTOTAL.to_s ).sum(:execution_price)
    #where("construction_type <> ? ", $INDEX_SUBTOTAL.to_s ).pluck(:execution_price).sum
  end
  
  #合計(歩掛り)
  def self.sumLaborProductivityUnit  
    sum(:labor_productivity_unit)
  end
  #合計(歩掛り計)
  def self.sumLaborProductivityUnitTotal  
    #工事種別が通常かまたは値引の場合のみ合算。
    #where("construction_type = ? or construction_type = ? ", "0", $INDEX_DISCOUNT.to_s ).sum(:labor_productivity_unit_total)
    
    #工事種別が小計以外は加算する
    where("construction_type <> ? ", $INDEX_SUBTOTAL.to_s ).sum(:labor_productivity_unit_total)
	
  end
  
  #合計(歩掛り-配管配線集計用)
  scope :sum_LPU_PipingWiring, -> quotation_header_id {where(:piping_wiring_flag => 1).where(quotation_header_id: quotation_header_id ).
                                   sum(:labor_productivity_unit)}
  #合計(歩掛り計-配管配線集計用)
  scope :sum_LPUT_PipingWiring, -> quotation_header_id {where(:piping_wiring_flag => 1).where(quotation_header_id: quotation_header_id ).
                                   sum(:labor_productivity_unit_total)}
  #合計(歩掛り-機器取付集計用)
  scope :sum_LPU_equipment_mounting, -> quotation_header_id {where(:equipment_mounting_flag => 1).where(quotation_header_id: quotation_header_id ).
                                   sum(:labor_productivity_unit)}
  #合計(歩掛り-機器取付集計用)
  scope :sum_LPUT_equipment_mounting, -> quotation_header_id {where(:equipment_mounting_flag => 1).where(quotation_header_id: quotation_header_id ).
                                   sum(:labor_productivity_unit_total)}
  #合計(歩掛り-労務費集計用)
  scope :sum_LPU_labor_cost, -> quotation_header_id {where(:labor_cost_flag => 1).where(quotation_header_id: quotation_header_id ).
                                   sum(:labor_productivity_unit)}
  #合計(歩掛り-労務費集計用)
  scope :sum_LPUT_labor_cost, -> quotation_header_id {where(:labor_cost_flag => 1).where(quotation_header_id: quotation_header_id ).
                                   sum(:labor_productivity_unit_total)}
  
  
  ######
  #add180105
  #配管・機器・労務集計において、金額の計も算出する
  
  #見積金額計
  
  #(配管配線集計用)
  scope :sum_quote_price_PipingWiring, -> quotation_header_id {where(:piping_wiring_flag => 1).where(quotation_header_id: quotation_header_id ).
                                   sum(:quote_price)}
  #(機器取付集計用)
  scope :sum_quote_price_equipment_mounting, -> quotation_header_id {where(:equipment_mounting_flag => 1).where(quotation_header_id: quotation_header_id ).
                                   sum(:quote_price)}
  
  #(労務費集計用)
  scope :sum_quote_price_labor_cost, -> quotation_header_id {where(:labor_cost_flag => 1).where(quotation_header_id: quotation_header_id ).
                                   sum(:quote_price)}
  
  #実行金額計
  
  #(配管配線集計用)
  scope :sum_execution_price_PipingWiring, -> quotation_header_id {where(:piping_wiring_flag => 1).where(quotation_header_id: quotation_header_id ).
                                   sum(:execution_price)}
  
  #(機器取付集計用)
  scope :sum_execution_price_equipment_mounting, -> quotation_header_id {where(:equipment_mounting_flag => 1).where(quotation_header_id: quotation_header_id ).
                                   sum(:execution_price)}
  
  #(労務費集計用)
  scope :sum_execution_price_labor_cost, -> quotation_header_id {where(:labor_cost_flag => 1).where(quotation_header_id: quotation_header_id ).
                                   sum(:execution_price)}
  ######
  
  
  scope :with_header_id, -> (quotation_detail_large_classifications_quotation_header_id=1) { joins(:QuotationHeader).where("quotation_headers.id = ?", quotation_detail_large_classifications_quotation_header_id )}
   
  def self.ransackable_scopes(auth_object=nil)
     [:with_header_id]
  end
  
  def self.ransackable_attributes(auth_object = nil)
    ["construction_type", "created_at", "equipment_mounting_flag", "execution_price", "execution_quantity", "execution_unit_price", "id", "labor_cost_flag", "labor_productivity_unit", "labor_productivity_unit_total", "last_line_number", "line_number", "piping_wiring_flag", "quantity", "quotation_header_id", "quotation_items_division_id", "quote_price", "remarks", "updated_at", "working_large_item_id", "working_large_item_name", "working_large_item_short_name", "working_large_specification", "working_middle_item_category_id", "working_middle_item_category_id_call", "working_middle_item_subcategory_id", "working_middle_item_subcategory_id_call", "working_specific_middle_item_id", "working_unit_id", "working_unit_name", "working_unit_price"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["QuotationHeader", "WorkingUnit", "quotation_detail_middle_classifications"]
  end

end
