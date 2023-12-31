class InventoryHistory < ApplicationRecord
  paginates_per 200  # 1ページあたり項目表示
  
  #demo版対応
  MAX_RECORD_COUNT = 10
  
  belongs_to :construction_datum, optional: true
  belongs_to :material_master, optional: true
  belongs_to :unit_master, optional: true
  belongs_to :supplier_master, optional: true

  #バリデーション
  validates :construction_datum_id, presence: true
  validates :material_master_id, presence: true
  validates :unit_master_id, presence: true
  validates :supplier_master_id, presence: true
  
  #demo版対応
  #validate :inventory_history_count_must_be_within_limit, on: :create

  #demo版対応
  def inventory_history_count_must_be_within_limit
    errors.add(:base, "デモ版は#{MAX_RECORD_COUNT}件しか登録できません") if InventoryHistory.count >= MAX_RECORD_COUNT
  end
  
  has_many :inventories, through: :material_master
  
  #入出庫区分（区分を増やす場合はここで追記する。app.controllerにも定数追加。）
  def self.inventory_division 
    [["入庫", 0], ["出庫", 1], ["棚卸", 2]] 
  end
  
  scope :with_maker_id, -> (inventory_history_maker_master_id=1) { joins(:material_master).where("material_masters.maker_id = ?", 
        inventory_history_maker_master_id )}
  scope :with_construction, -> (inventory_history_construction_datum_id=1) { joins(:construction_datum).where("construction_data.id = ?",
        inventory_history_construction_datum_id )}
  scope :with_customer, -> (inventory_history_customer_id=1){joins(:construction_datum).where("construction_data.customer_id = ?", inventory_history_customer_id )}
  
  scope :with_material_code, -> (inventory_history_material_id=1){joins(:material_master).where("material_masters.id = ?", inventory_history_material_id )}
  
  scope :with_material_code_include, -> inventory_history_material_code {
  if inventory_history_material_code.present? 
    joins(:material_master).where("material_masters.material_code like ?", '%' + inventory_history_material_code + '%' )
  end
  }
  scope :with_material_name_include, -> inventory_history_material_name {
  if inventory_history_material_name.present? 
    joins(:material_master).where("material_masters.material_name like ?", '%' + inventory_history_material_name + '%' )
  end
  }
  
  def self.ransackable_scopes(auth_object=nil)
    [:with_maker_id, :with_construction, :with_customer, :with_material_code, :with_material_code_include, :with_material_name_include]
      
  end
  
  #金額合計（出庫は除く）
  def self.sumPrice  
    #sum(:price)
    where.not(:inventory_division_id => $INDEX_INVENTORY_SHIPPING).sum(:price)
  end
  #金額合計（出庫はマイナス）
  def self.sumShipPrice  
    #sum(:price)
    where(:inventory_division_id => $INDEX_INVENTORY_SHIPPING).sum(:price) * -1
  end
	
  #数量合計（出庫は除く）
  def self.sumQuantity
    where.not(:inventory_division_id => $INDEX_INVENTORY_SHIPPING).sum(:quantity) 
  end
  #数量合計（出庫をマイナスで集計する）
  def self.sumShipQuantity
    where(:inventory_division_id => $INDEX_INVENTORY_SHIPPING).sum(:quantity) * -1
  end
  def self.ransackable_attributes(auth_object = nil)
    ["construction_datum_id", "created_at", "current_history_id", "current_quantity", "current_unit_price", "current_warehousing_date", "id", "inventory_date", "inventory_division_id", "inventory_quantity", "material_master_id", "next_history_id_1", "next_quantity_1", "next_unit_price_1", "next_warehousing_date_1", "previous_quantity", "previous_unit_price", "price", "purchase_datum_id", "quantity", "slip_code", "supplier_master_id", "unit_master_id", "unit_price", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["construction_datum", "inventories", "material_master", "supplier_master", "unit_master"]
  end
end
