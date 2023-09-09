class Inventory < ApplicationRecord
  paginates_per 200  # 1ページあたり項目表示
  #demo
  MAX_RECORD_COUNT = 10
  
  belongs_to :material_master, optional: true
  belongs_to :unit_master, optional: true
  
  #add171026
  belongs_to :supplier_master, optional: true
  
  #ファイルのアップローダー追加 add 171218
  mount_uploader :image, ImagesUploader
  
  #seedのため、一旦validate解除!!! ---from
  
  ##バリデーション
  #validates_numericality_of :inventory_quantity, :only_float => true, :allow_nil => false    #upd180608 int to float
  #validates_numericality_of :inventory_amount, :only_integer => true, :allow_nil => false
  #validates_numericality_of :current_quantity, :only_float => true, :allow_nil => false      #upd180608 int to float
  #validates_numericality_of :current_unit_price, :allow_nil => false
  #validates_numericality_of :last_unit_price, :allow_nil => false
  #validates :supplier_master_id, presence: true  
  #validates :material_master_id, presence: true
  
  #seedのため、一旦validate解除!!! ---to
  
  #
  #demo版対応
  #validate :inventory_count_must_be_within_limit, on: :create
  
  #add171027
  #活動フラグ判定用追加
  attr_accessor :action_flag
  
  scope :with_material_name_include, -> inventory_material_name {
  if inventory_material_name.present? 
    joins(:material_master).where("material_masters.material_name like ?", '%' + inventory_material_name + '%' )
  end
  }
  scope :with_material_category_include, -> (inventory_material_category=1) {
    
  category_id = inventory_material_category.to_i 

  #220126抹消
  #idが１以上でないと呼び出されないため、viewで１をプラスしているので、ここでマイナスしてあげる。
  #category_id -= 1
	 
  joins(:material_master).where("material_masters.inventory_category_id = ?", category_id )
  }
  
  #del220126(マスター化)
  #在庫品目（品目を増やす場合はここで追記する。app.controllerにも定数追加(?不要?)。）
  #def self.category 
  #  [["エアコン部材", 0], ["配線器具", 1], ["ケーブル", 2], ["照明器具", 3], ["アンテナ", 4], ["分電盤", 5], ["ドアホン", 6], ["アース棒", 7], 
  #  ["開閉器", 8] ]
  #end
  #demo版対応
  def inventory_count_must_be_within_limit
    errors.add(:base, "デモ版は#{MAX_RECORD_COUNT}件しか登録できません") if Inventory.count >= MAX_RECORD_COUNT
  end
    
  def self.ransackable_scopes(auth_object=nil)
      [:with_material_name_include, :with_material_category_include]
      
  end
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "current_history_id", "current_quantity", "current_unit_price", "current_warehousing_date", "id", "image", "inventory_amount", "inventory_quantity", "last_unit_price", "last_warehousing_date", "location_id", "material_master_id", "next_history_id_1", "next_history_id_2", "next_quantity_1", "next_quantity_2", "next_unit_price_1", "next_unit_price_2", "next_warehousing_date_1", "next_warehousing_date_2", "no_stocktake_flag", "supplier_master_id", "unit_master_id", "updated_at", "warehouse_id"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["material_master", "supplier_master", "unit_master"]
  end
end
