class MaterialMaster < ApplicationRecord
  paginates_per 200  # 1ページあたり項目表示
  #demo版対応
  MAX_RECORD_COUNT = 11

  #belongs_to :PurchaseDatum
  #belongs_to :MakerMaster, :foreign_key => "maker_id"
  #Rails6対応
  belongs_to :PurchaseDatum, optional: true
  belongs_to :MakerMaster, optional: true, :foreign_key => "maker_id"
    
  has_many :PurchaseUnitPrice, :foreign_key => "material_id"  #add201208
    
  #Rails6対応(optional: true)
  belongs_to :material_category, optional: true
  belongs_to :inventory_category, optional: true
    
  has_many :UnitMaster
  
  has_many :inventories

  #seedのため、一旦validate解除!!! ---from
  
  ##バリデーション
  #validates :material_code, presence: true, uniqueness: true
  #validates :maker_id, presence: true
  #validate :maker_existing
  
  #seedのため、一旦validate解除!!! ---to
    
  #demo版対応
  #validate :material_master_count_must_be_within_limit, on: :create

  #demo版対応
  def material_master_count_must_be_within_limit
    errors.add(:base, "デモ版は#{MAX_RECORD_COUNT}件しか登録できません") if MaterialMaster.count >= MAX_RECORD_COUNT
  end

  def add_error_sample
    if maker_id.nil?
      errors[:maker_id] << "＊メーカーは必ず入力して下さい"
    end
  end
     
  #select2高速化のための処理
  #scope :search_faster, lambda { |query| where('material_name LIKE ?', "%#{query}%").limit(100) }
	 
  scope :with_maker, -> (id=1){joins(:MakerMaster).where("maker_masters.id = material_masters.maker_id" )}
  #在庫品目のみリストにあげたい場合に利用
  #scope :with_inventory_item, -> { where.not(:inventory_category_id => nil).where("inventory_category_id > ?", 0) }
  scope :with_inventory_item, -> { where.not(:inventory_category_id => nil) }
   
  scope :with_category, -> (id=1){joins(:material_category)}
   
   
  #add201208
  #scope :with_supplier_material_code, -> (dummy, supplier_material_id) { 
  #scope :with_supplier_material_code, -> (supplier_material_id=1) {
  scope :with_supplier_material_code, -> (supplier_material_id) {
      
  if supplier_material_id.present?
    strAry = supplier_material_id.split(",")  #仕入先id, 品番idで結合されたキーの為、分割させる
    joins(:PurchaseUnitPrice).where("purchase_unit_prices.material_id = ?", strAry[1] )
  end
  }
   
   
  def self.ransackable_scopes(auth_object=nil)
    [:with_maker, :with_category, :with_supplier_material_code]
    #[:with_maker, :with_category]
  end
   
   
   
  #230630 moved from private for ruby3
  #リスト表示用(CD/名称)
  def p_material_code_name
    if self.material_code.nil?
      material_code = "-"
    else 
      material_code = self.material_code
    end
    #add190206
    #社内コードがあれば優先
    if !self.internal_code.blank?
      material_code = self.internal_code
    end
    #
    if self.material_name.nil?
      material_name = "-"
    else 
      material_name = self.material_name
    end    
    #if self.MakerMaster.nil?
    #  maker_name = "-"
    #else 
    #  maker_name = self.MakerMaster.maker_name
    #end    	
      
    #material_code + ':' + material_name + ':' + maker_name  
    #上記だと著しく遅くなる・・・
    
    material_code + ':' + material_name 
  end
    
  #230630 moved from private for ruby3
  #リスト表示用(CDのみ)
  def p_material_code
    material_code = "-"
    if !self.material_code.nil?
      material_code = self.material_code
    end
    #社内コードがあれば優先
    if !self.internal_code.blank?
      material_code = self.internal_code
    end
    #
    material_code
  end
  
  private
  def maker_existing
    errors.add(MakerMaster, :missing) if MakerMaster.blank?
  end
   
   
  #ruby3
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "internal_code", "inventory_category_id", "last_unit_price", "last_unit_price_update_at", "list_price", "list_price_quotation", "list_price_update_at", "maker_id", "material_category_id", "material_code", "material_name", "notes", "standard_labor_productivity_unit", "standard_quantity", "standard_rate", "unit_id", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["MakerMaster", "PurchaseDatum", "PurchaseUnitPrice", "UnitMaster", "inventories", "inventory_category", "material_category"]
  end
end
