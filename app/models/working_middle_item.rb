class WorkingMiddleItem < ApplicationRecord

  #demo版対応
  MAX_RECORD_COUNT = 5
  
  before_destroy :ensure_id
  
  #require "browser"
  #browser = Browser.new("Some User Agent", accept_language: "en-us")
  #paginates_per 200  # 1ページあたり項目表示

  belongs_to :WorkingUnit, optional: true,:foreign_key => "working_unit_id"
  belongs_to :MaterialMaster, optional: true, :foreign_key => "material_id"
   
  has_many :working_small_items
  accepts_nested_attributes_for :working_small_items, allow_destroy: true
   
  belongs_to :working_category, optional: true, :foreign_key => "working_middle_item_category_id"
  #add180202
  belongs_to :working_subcategory, optional: true
  
  #明細（小）フォームajax用
  attr_accessor :material_id_hide     
  attr_accessor :material_code_hide
  attr_accessor :material_name_hide
  attr_accessor :quantity_hide
  attr_accessor :unit_price_hide
  attr_accessor :labor_productivity_unit_hide
  attr_accessor :material_price_hide  
  attr_accessor :maker_id_hide        
  attr_accessor :unit_master_id_hide  
  attr_accessor :working_subcategory_select_hide 
  attr_accessor :list_price_color_hide 
  attr_accessor :rate_hide   #add180726
   
  #明細合計用
  attr_accessor :material_cost_total
  attr_accessor :labor_productivity_unit_sum
  attr_accessor :labor_cost
  
  #標準版対応
  attr_accessor :estimate_material_cost_rate
  attr_accessor :estimate_labor_cost
  #
  
  #
  attr_accessor :master_insert_flag
  #活動フラグ判定用
  attr_accessor :action_flag
   
  #マスター呼出用  
  attr_accessor :working_middle_item_for_call
  attr_accessor :working_middle_item_category_for_call
  attr_accessor :working_middle_item_subcategory_for_call
  #attr_accessor :working_subcategory_for_call  #add180202
  attr_accessor :working_middle_item_short_name_for_call
  attr_accessor :working_middle_item_id_select_hide
  attr_accessor :working_middle_item_short_name_select_hide
  ##
   
  #validation 
  validates :working_middle_item_name, presence: true

  #demo版対応
  validate :working_middle_item_matter_must_be_within_limit, on: :create

  #demo版対応
  def working_middle_item_matter_must_be_within_limit
    errors.add(:base, "デモ版は#{MAX_RECORD_COUNT}件しか登録できません") if WorkingMiddleItem.count >= MAX_RECORD_COUNT
  end
  #特定のIDは削除できないようにする
  def ensure_id
    return true if "#{id}".to_i > 1  #id1は削除できないように
    errors.add(:base, "Cannot delete booking with payments")
    throw :abort  #Rails6
    return false
  end
  scope :with_material, -> {joins(:MaterialMaster)}
  scope :with_unit, -> {joins(:WorkingUnit)}
  scope :with_category, -> {joins(:working_category)}
  scope :with_id, -> (working_middle_item_id=1) { where("working_middle_items.id = ?", working_middle_item_id )}
   
  #カテゴリー項目
  def self.categories 
    #[["-", 0], ["幹線", 1], ["接地", 2], ["配管配線", 3], ["配線器具(ワイド２１)", 4], ["配線器具(フルカラー)", 5], ["器具取付", 6], ["ボックス", 7],["換気ダクト", 8],["テレビ", 9]] 
	  [["-", 0], ["配線器具(ワイド２１)", 1], ["配線器具(フルカラー)", 2], ["配管配線", 3], ["換気ダクト", 4], ["器具取付", 5], ["幹線", 6], ["接地", 7],["ボックス", 8],["テレビ", 9]] 
  end
   
  def self.ransackable_scopes(auth_object=nil)
    [:with_unit, :with_id]
  end
   
  def self.ransackable_attributes(auth_object = nil)
    ["accessory_cost", "created_at", "execution_labor_unit_price", "execution_material_unit_price", "execution_unit_price", "id", "labor_cost_total", "labor_productivity_unit", "labor_productivity_unit_total", "labor_unit_price", "labor_unit_price_standard", "material_cost_total", "material_id", "material_quantity", "material_unit_price", "other_cost", "seq", "updated_at", "working_material_name", "working_middle_item_category_id", "working_middle_item_name", "working_middle_item_short_name", "working_middle_specification", "working_subcategory_id", "working_unit_id", "working_unit_name", "working_unit_price"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["MaterialMaster", "WorkingUnit", "working_category", "working_small_items", "working_subcategory"]
  end
  #acts_as_list
 
end
