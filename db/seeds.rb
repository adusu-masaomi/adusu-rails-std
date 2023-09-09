# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "csv"

#資材マスターの定価を更新する

#require 'date'
#update_date = '2017-10-01'.to_date  #カタログの更新日とする

#日時型の場合
#require 'time'
#update_time = "2017-10-01 00:00:00 +0900"  #カタログの更新日とする
#update_time_to_time = Time.parse(update_time)

######################
#renderの初期データ用　消さない事 適宜、コメントアウトする

#ユーザーの初期データ(初回アップロード用に使用--消さない事)
#User.create!(
#   name: 'adusu',
#   email: 'adusu-info@eos.ocn.ne.jp',
#   password: 'adusu63325', 
#   password_digest: '$2a$12$txtWNUkWEoNnmHkz2skkwu/8wLJpy3rp/.bgzAhAQykBhKBGVfvbC'
#)

#(株)アデュース　データ移行用(社内sys→render.com)


#working_small_items
CSV.foreach('db/working_small_items.csv') do |row|
  WorkingSmallItem.create do |w|
    w.id = row[0]
    w.working_middle_item_id = row[1]
    w.working_small_item_id = row[2]
    w.working_small_item_code = row[3]
    w.working_small_item_name = row[4]
    w.rate = row[5]
    w.unit_price = row[6]
    w.quantity = row[7]
    w.material_price = row[8]
    w.maker_master_id = row[9]
    w.unit_master_id = row[10]
    w.labor_productivity_unit = row[11]
    w.created_at = row[12]
    w.updated_at = row[13]
  end
end

#working_specific_middle_items
CSV.foreach('db/working_specific_middle_items.csv') do |row|
  WorkingSpecificMiddleItem.create do |w|
    w.id = row[0]
    w.quotation_header_id = row[1]
    w.delivery_slip_header_id = row[2]
    w.working_middle_item_name = row[3]
    w.working_middle_item_short_name = row[4]
    w.working_middle_item_category_id = row[5]
    w.working_subcategory_id = row[6]
    w.working_middle_specification = row[7]
    w.working_unit_id = row[8]
    w.working_unit_name = row[9]
    w.working_unit_price = row[10]
    w.execution_unit_price = row[11]
    w.material_id = row[12]
    w.working_material_name = row[13]
    w.execution_material_unit_price = row[14]
    w.material_unit_price = row[15]
    w.execution_labor_unit_price = row[16]
    w.labor_unit_price = row[17]
    w.labor_unit_price_standard = row[18]
    w.labor_productivity_unit = row[19]
    w.labor_productivity_unit_total = row[20]
    w.material_cost_total = row[21]
    w.seq = row[22]
    w.created_at = row[23]
    w.updated_at = row[24]
  end
end

#working_specific_small_items
CSV.foreach('db/working_specific_small_items.csv') do |row|
  WorkingSpecificSmallItem.create do |w|
    w.id = row[0]
    w.working_specific_middle_item_id = row[1]
    w.working_small_item_id = row[2]
    w.working_small_item_code = row[3]
    w.working_small_item_name = row[4]
    w.unit_price = row[5]
    w.rate = row[6]
    w.quantity = row[7]
    w.material_price = row[8]
    w.maker_master_id = row[9]
    w.unit_master_id = row[10]
    w.labor_productivity_unit = row[11]
    w.created_at = row[12]
    w.updated_at = row[13]
  end
end

#working_subcategories
CSV.foreach('db/working_subcategories.csv') do |row|
  WorkingSubcategory.create do |w|
    w.id = row[0]
    w.working_category_id = row[1]
    w.name = row[2]
    w.seq = row[3]
    w.created_at = row[4]
    w.updated_at = row[5]
  end
end

#移行不要
#working_times
#CSV.foreach('db/working_times.csv') do |row|
#  WorkingTime.create do |w|
#    w.id = row[0]
#    w.employment_status_id = row[1]
#    w.working_time_start_time = row[2]
#    w.working_time_end_time = row[3]
#    w.overtime_start_time = row[4]
#    w.overtime_end_time = row[5]
#    w.overtime_early_start_time = row[6]
#    w.overtime_early_end_time = row[7]
#    w.overtime_midnight_start_time = row[8]
#    w.overtime_midnight_end_time = row[9]
#    w.break_time_1_start_time = row[10]
#    w.break_time_1_end_time = row[11]
#    w.break_time_2_start_time = row[12]
#    w.break_time_2_end_time = row[13]
#    w.break_time_3_start_time = row[14]
#    w.break_time_3_end_time = row[15]
#    w.created_at = row[16]
#    w.updated_at = row[17]
#end

#working_units
CSV.foreach('db/working_units.csv') do |row|
  WorkingUnit.create do |w|
    w.id = row[0]
    w.working_unit_name = row[1]
    w.seq = row[2]
    w.created_at = row[3]
    w.updated_at = row[4]
  end
end
