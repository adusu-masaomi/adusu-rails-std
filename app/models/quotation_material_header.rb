class QuotationMaterialHeader < ApplicationRecord

  #belongs_to :construction_datum
  #belongs_to :supplier_master
  #seed用
  belongs_to :construction_datum, optional: true
  belongs_to :supplier_master, optional: true
  
  has_many :quotation_material_details
  accepts_nested_attributes_for :quotation_material_details, :allow_destroy => true
  
  #備考(1~3を切り分けるため)
  attr_accessor :notes
  
  #ボタン切り分け用
  attr_accessor :sent_flag
  
  #見積依頼メール判定フラグ（済or未）
  attr_accessor :quotation_email_flag
  
  #add180919
  #強制注文フラグ
  attr_accessor :force_order_flag
  #ダミー用
  attr_accessor :empty
  
  #全チェック(落札)フラグ
  attr_accessor :all_bid_flag
  
  #資材ID自動セット用
  attr_accessor :material_id_hide
  
  #注文No
  #add171023
  attr_accessor :purchase_order_code
  
  #add220607
  attr_accessor :format
  
  #seed用　del
  #バリデーション
  #validates :quotation_code, presence: true
  #del end
  
  #参照見積コード
  #attr_accessor :quotation_header_origin_id
  
  #rails6
  def self.ransackable_attributes(auth_object = nil)
    ["all_bid_flag_1", "all_bid_flag_2", "all_bid_flag_3", "construction_datum_id", "created_at", "delivery_place_flag", "email", "id", "notes_1", "notes_2", "notes_3", "order_email_flag_1", "order_email_flag_2", "order_email_flag_3", "quotation_code", "quotation_email_flag_1", "quotation_email_flag_2", "quotation_email_flag_3", "quotation_header_origin_id", "requested_date", "responsible", "supplier_id_1", "supplier_id_2", "supplier_id_3", "supplier_master_id", "supplier_responsible_id_1", "supplier_responsible_id_2", "supplier_responsible_id_3", "total_order_price_1", "total_order_price_2", "total_order_price_3", "total_quotation_price_1", "total_quotation_price_2", "total_quotation_price_3", "updated_at"]
  end

end
