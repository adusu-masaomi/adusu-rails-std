class PurchaseUnitPrice < ApplicationRecord
  self.primary_keys = :supplier_id, :material_id

  #belongs_to :supplier_masters, :foreign_key => "supplier_id"
  belongs_to :SupplierMaster, :foreign_key => "supplier_id"

  #has_many :material_masters
  #belongs_to :material_masters
  belongs_to :MaterialMaster, :foreign_key => "material_id"

  #has_many :unit_masters, :foreign_key => "unit_id"
  belongs_to :UnitMaster, :foreign_key => "unit_id"
  
  validates :supplier_id, uniqueness: {message: ",資材コードが同じ組み合わせのレコードが既に存在します。", scope: [:material_id]}

  scope :with_unit, -> {joins(:UnitMaster)}
   
  def self.ransackable_scopes(auth_object=nil)
      [:with_unit]
  end
  #ruby3
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "list_price", "material_id", "supplier_id", "supplier_material_code", "unit_id", "unit_price", "updated_at"]
  end
end
