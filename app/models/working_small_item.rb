class WorkingSmallItem < ApplicationRecord
  #belongs_to :working_middle_item
  belongs_to :working_middle_item, optional: true
  
  #明細（小）フォーム用
  #attr_accessor :material_price  フィールド化180201
  attr_accessor :labor_productivity_unit_total
  
  #attr_accessor :action_flag_child
  
end
