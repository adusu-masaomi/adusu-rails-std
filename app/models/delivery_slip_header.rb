class DeliverySlipHeader < ApplicationRecord

  paginates_per 200  # 1ページあたり項目表示

  #demo版対応
  MAX_RECORD_COUNT = 10
  
  belongs_to :ConstructionDatum, optional: true, :foreign_key => "construction_datum_id"
   
  belongs_to :customer_master, :foreign_key => "customer_id"
  accepts_nested_attributes_for :customer_master, update_only: true
	
  attr_accessor :customer_id_hide	
	
  #バリデーション
  #validates :delivery_slip_code, presence: true, uniqueness: true	
  #納品書コードはユニークのチェックのみ。nullチェックはコピーに失敗するため除外。
  validates :delivery_slip_code, presence:true, uniqueness: true

  #demo版対応
  validate :delivery_slip_header_count_must_be_within_limit, on: :create

  #demo版対応
  def delivery_slip_header_count_must_be_within_limit
    errors.add(:base, "デモ版は#{MAX_RECORD_COUNT}件しか登録できません") if DeliverySlipHeader.count >= MAX_RECORD_COUNT
  end


  ##add180123
  #住所に番地等を入れないようにするためのバリデーション(冗長だが他に方法が見当たらない)
  ADDRESS_ERROR_MESSAGE = "番地（番地）は入力できません。"
  ADDRESS_ERROR_MESSAGE_2 = "番地（丁目）は入力できません。"
  ADDRESS_ERROR_MESSAGE_3 = "番地（ハイフン）は入力できません。"
  ADDRESS_ERROR_MESSAGE_4 = "番地（数字）は入力できません。"
   
  validates :address, format: {without: /丁目/ , :message => ADDRESS_ERROR_MESSAGE_2 }
  validates :address, format: {without: /番地/ , :message => ADDRESS_ERROR_MESSAGE }
  #「流通センター」などの地名も有るため、許可する。
  #validates :address, format: {without: /ー/ , :message => ADDRESS_ERROR_MESSAGE_3 }
  #validates :address, format: {without: /−/ , :message => ADDRESS_ERROR_MESSAGE_3 }
  validates :address, format: {without: /-/ , :message => ADDRESS_ERROR_MESSAGE_3 }
   
  #add180817
  validate :check_fixed
   
  #住所に数値が混じっていた場合も禁止する
  validate  :address_regex
  def address_regex
    if address.match(/[0-9０-９]+$/)
      errors.add :address, ADDRESS_ERROR_MESSAGE_4
    end
  end
   
  #add180817
  def check_fixed
    if fixed_flag == 1
      errors.add(:delivery_slip_code, ": 確定済みです。変更したい場合は、" << 
      "　　　　　　　　" << "「確定済み」のチェックを外してください。")
    end
  end
   
  #見積書用（工事場所）
  validates :construction_place, format: {without: /丁目/ , :message => ADDRESS_ERROR_MESSAGE_2 }
  validates :construction_place, format: {without: /番地/ , :message => ADDRESS_ERROR_MESSAGE }
  #「流通センター」などの地名も有るため、許可する。
  #validates :construction_place, format: {without: /ー/ , :message => ADDRESS_ERROR_MESSAGE_3 }
  #validates :construction_place, format: {without: /−/ , :message => ADDRESS_ERROR_MESSAGE_3 }
  validates :construction_place, format: {without: /-/ , :message => ADDRESS_ERROR_MESSAGE_3 }
   
  #住所に数値が混じっていた場合も禁止する
  validate  :construction_place_regex
  def construction_place_regex
    if construction_place.match(/[0-9０-９]+$/)
     errors.add :construction_place, ADDRESS_ERROR_MESSAGE_4
    end
  end
   
  ##add end 
	
  scope :with_id, -> (delivery_slip_headers_id=1) { where("delivery_slip_headers.id = ?", delivery_slip_headers_id )}
   
  def self.ransackable_scopes(auth_object=nil)
    [:with_id]
  end
   
   
  #リスト表示用(CD/件名)
	def p_delv_cd_name
	
	    #binding.pry
	
        if self.delivery_slip_code.nil?
           delivery_slip_code = "-"
        else 
           delivery_slip_code = self.delivery_slip_code
        end
        if self.construction_name.nil?
           construction_name = "-"
        else 
           construction_name = self.construction_name
        end        

        delivery_slip_code + ':' + construction_name 
    end
   
  def self.ransackable_attributes(auth_object = nil)
    ["address", "address2", "category_saved_flag", "category_saved_id", "construction_datum_id", "construction_house_number", "construction_name", "construction_period", "construction_period_date1", "construction_period_date2", "construction_place", "construction_place2", "construction_post", "created_at", "customer_id", "customer_name", "delivery_amount", "delivery_slip_code", "delivery_slip_date", "delivery_slip_header_origin_id", "execution_amount", "fax", "final_return_division", "fixed_flag", "honorific_id", "house_number", "id", "invoice_code", "last_line_number", "post", "quotation_code", "responsible1", "responsible2", "subcategory_saved_id", "tel", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["ConstructionDatum", "customer_master"]
  end

end
