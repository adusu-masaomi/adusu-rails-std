class Stocktake < ApplicationRecord
  paginates_per 200  # 1ページあたり項目表示

  #demo版対応
  MAX_RECORD_COUNT = 10

  belongs_to :material_master, optional: true
  belongs_to :inventory, optional: true
  
  #ajax用
  attr_accessor :unit_price_hide
  attr_accessor :quantity_hide
  attr_accessor :amount_hide
  attr_accessor :difference
  attr_accessor :different_amount
  
  #attr_accessor :inventory_id_hide  #add171128
  
  validates :material_master_id, presence: true
  
  #棚卸日＆アイテムの重複登録防止。
  validates :stocktake_date,  presence: true, uniqueness: { scope: [:material_master_id] }

  #demo版対応
  #validate :stocktake_count_must_be_within_limit, on: :create

  #demo版対応
  def stocktake_count_must_be_within_limit
    errors.add(:base, "デモ版は#{MAX_RECORD_COUNT}件しか登録できません") if Stocktake.count >= MAX_RECORD_COUNT
  end
  
  scope :with_material_category_include, -> (inventory_material_category=1) {
    
  category_id = inventory_material_category.to_i 
	
  #del220126
  #idが１以上でないと呼び出されないため、viewで１をプラスしているので、ここでマイナスしてあげる。
  #category_id -= 1
	 
  joins(:inventory).joins(:material_master).where("material_masters.inventory_category_id = ?", category_id )
	
  }
  
  def self.ransackable_scopes(auth_object=nil)
      [ :with_material_category_include]
  end
  def self.ransackable_attributes(auth_object = nil)
    ["book_amount", "book_quantity", "created_at", "id", "inventory_id", "inventory_update_flag", "material_master_id", "physical_amount", "physical_quantity", "stocktake_date", "unit_price", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["inventory", "material_master"]
  end
end
