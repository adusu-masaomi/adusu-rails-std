class SupplierMaster < ApplicationRecord
  #demo版対応
  MAX_RECORD_COUNT = 11
  
  paginates_per 200  # 1ページあたり項目表示　

  before_destroy :ensure_id
  
  #belongs_to :PurchaseDatum  #--> necessary??
  #rails6対応
  belongs_to :PurchaseDatum, optional: true  #--> necessary??
  has_many :purchase_unit_prices	
  has_many :purchase_data, :foreign_key => "supplier_id"
  #add220108
  has_many :purchase_order_data
  
  #add210629
  has_many :supplier_responsibles, dependent: :destroy
  accepts_nested_attributes_for :supplier_responsibles, allow_destroy: true
  
  #標準版仕様 add230608
  def self.account_type_division 
    [["普通", 0], ["当座", 1]] 
  end
  
  #バリデーション
  validates :supplier_name, presence: true
  #demo版対応
  #validate :supplier_count_must_be_within_limit, on: :create
  
  #demo版対応
  def supplier_count_must_be_within_limit
    errors.add(:base, "デモ版は#{MAX_RECORD_COUNT}件しか登録できません") if SupplierMaster.count >= MAX_RECORD_COUNT
  end
  
  # validates :customer_id, presence: true, if: "customer_id.nil?"
  def self.to_csv(options = {})
      CSV.generate do |csv|
        # column_namesはカラム名を配列で返す
        # 例: ["id", "name", "price", "released_on", ...]
	    #csv << column_names
        #csv << ["id", "customer_name", "post"]
        
        #ヘッダ
        csv_column_names = ["id", "仕入先名", "電話番号", "FAX", "担当者"]
        csv << csv_column_names
        
        all.each do |supplier_master|
          
        
          # attributes はカラム名と値のハッシュを返す
          # 例: {"id"=>1, "name"=>"レコーダー", "price"=>3000, ... }
          # valudes_at はハッシュから引数で指定したキーに対応する値を取り出し、配列にして返す
          # 下の行は最終的に column_namesで指定したvalue値の配列を返す
    	    #if customer_master.card_not_flag != 1     #年賀状対象外は外す。
		        csv << supplier_master.csv_column_values
          #end
       end
    end
  end
  def csv_column_values
    [id, supplier_name, tel_main, fax_main, email_main, responsible1 ]
  end
  
  #特定のIDは削除できないようにする
  def ensure_id
    return true if "#{id}".to_i > 2  #id1,2は削除できないように
    errors.add(:base, "Cannot delete booking with payments")
    throw :abort  #Rails6
    return false
  end
  
  #ruby 3
  def self.ransackable_attributes(auth_object = nil)
    ["account_number", "account_type", "address", "bank_branch_name", "bank_name", "created_at", "email1", "email2", "email3", "email_cc", "email_main", "fax_main", "holder", "id", "outsourcing_flag", "post", "responsible1", "responsible2", "responsible3", "responsible_cc", "responsible_name", "responsible_title", "search_character", "supplier_name", "tel_main", "updated_at"]
  end
end
