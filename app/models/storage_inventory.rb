class StorageInventory < ActiveRecord::Base
  paginates_per 200  # 1ページあたり項目表示
  
  belongs_to :material_master
  #belongs_to :unit_master
  belongs_to :unit_master , optional: true
  
  #validates :warehouse_id, presence: true
  
  #倉庫
  def self.warehouse
    [["事務所", 0], ["倉庫", 1]] 
  end
  
  scope :with_material_category_include, -> (material_category=1) {
    category_id = material_category.to_i 
    joins(:material_master).where("material_masters.inventory_category_id = ?", category_id )
  }
  def self.ransackable_scopes(auth_object=nil)
    [:with_material_category_include]
  end
  
  #rails6用
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "location_id", "material_master_id", "quantity", "unit_master_id", "unit_price", "updated_at", "warehouse_id"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["material_master", "unit_master"]
  end
end
