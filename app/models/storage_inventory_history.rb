class StorageInventoryHistory < ApplicationRecord
  
  paginates_per 200  # 1ページあたり項目表示
  
  belongs_to :construction_datum, optional: true
  belongs_to :material_master
  belongs_to :supplier_master, optional: true
  belongs_to :purchase_order_datum , optional: true
  #belongs_to :inventory_division, optional: true
  
  scope :with_construction, -> (storage_inventory_histories_construction_datum_id=1) { joins(:construction_datum).
         where("construction_data.id = ?", storage_inventory_histories_construction_datum_id )}
  
  def self.ransackable_scopes(auth_object=nil)
    [:with_construction]
  end
  def self.ransackable_attributes(auth_object = nil)
    ["amount", "construction_datum_id", "created_at", "id", "inventory_division_id", "material_master_id", "occurred_date", "purchase_order_datum_id", "quantity", "slip_code", "supplier_master_id", "unit_price", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["construction_datum", "material_master", "purchase_order_datum", "supplier_master"]
  end
end
