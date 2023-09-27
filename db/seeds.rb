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

#最新必須
#delivery_slip_detail_large_classifications
CSV.foreach('db/delivery_slip_detail_large_classifications.csv') do |row|
  DeliverySlipDetailLargeClassification.create do |d|
    d.id = row[0]
    d.delivery_slip_header_id = row[1]
    d.delivery_slip_items_division_id = row[2]
    d.working_large_item_id = row[3]
    d.working_specific_middle_item_id = row[4]
    d.working_large_item_name = row[5]
    d.working_large_item_short_name = row[6]
    d.working_middle_item_category_id = row[7]
    d.working_middle_item_category_id_call = row[8]
    d.working_middle_item_subcategory_id = row[9]
    d.working_middle_item_subcategory_id_call = row[10]
    d.working_large_specification = row[11]
    d.line_number = row[12]
    d.quantity = row[13]
    d.execution_quantity = row[14]
    d.working_unit_id = row[15]
    d.working_unit_name = row[16]
    d.working_unit_price = row[17]
    d.delivery_slip_price = row[18]
    d.execution_unit_price = row[19]
    d.execution_price = row[20]
    d.labor_productivity_unit = row[21]
    d.labor_productivity_unit_total = row[22]
    d.last_line_number = row[23]
    d.remarks = row[24]
    d.construction_type = row[25]
    d.piping_wiring_flag = row[26]
    d.equipment_mounting_flag = row[27]
    d.labor_cost_flag = row[28]
    d.created_at = row[29]
    d.updated_at = row[30]
  end
end

#invoice_detail_large_classifications
CSV.foreach('db/invoice_detail_large_classifications.csv') do |row|
  InvoiceDetailLargeClassification.create do |i|
    i.id = row[0]
    i.invoice_header_id = row[1]
    i.invoice_items_division_id = row[2]
    i.working_large_item_id = row[3]
    i.working_large_item_name = row[4]
    i.working_large_item_short_name = row[5]
    i.working_large_specification = row[6]
    i.line_number = row[7]
    i.quantity = row[8]
    i.execution_quantity = row[9]
    i.working_unit_id = row[10]
    i.working_unit_name = row[11]
    i.working_unit_price = row[12]
    i.invoice_price = row[13]
    i.execution_unit_price = row[14]
    i.execution_price = row[15]
    i.labor_productivity_unit = row[16]
    i.labor_productivity_unit_total = row[17]
    i.last_line_number = row[18]
    i.remarks = row[19]
    i.delivery_slip_header_id = row[20]
    i.construction_type = row[21]
    i.piping_wiring_flag = row[22]
    i.equipment_mounting_flag = row[23]
    i.labor_cost_flag = row[24]
    i.created_at = row[25]
    i.updated_at = row[26]
  end
end

#invoice_detail_middle_classifications
CSV.foreach('db/invoice_detail_middle_classifications.csv') do |row|
  InvoiceDetailMiddleClassification.create do |i|
    i.id = row[0]
    i.invoice_header_id = row[1]
    i.invoice_detail_large_classification_id = row[2]
    i.invoice_item_division_id = row[3]
    i.working_middle_item_id = row[4]
    i.working_middle_item_name = row[5]
    i.working_middle_item_short_name = row[6]
    i.line_number = row[7]
    i.working_middle_specification = row[8]
    i.quantity = row[9]
    i.execution_quantity = row[10]
    i.working_unit_id = row[11]
    i.working_unit_name = row[12]
    i.working_unit_price = row[13]
    i.invoice_price = row[14]
    i.execution_unit_price = row[15]
    i.execution_price = row[16]
    i.material_id = row[17]
    i.working_material_name = row[18]
    i.material_unit_price = row[19]
    i.labor_unit_price = row[20]
    i.labor_productivity_unit = row[21]
    i.labor_productivity_unit_total = row[22]
    i.material_quantity = row[23]
    i.accessory_cost = row[24]
    i.material_cost_total = row[25]
    i.other_cost = row[26]
    i.other_cost = row[27]
    i.remarks = row[28]
    i.construction_type = row[29]
    i.piping_wiring_flag = row[30]
    i.equipment_mounting_flag = row[31]
    i.labor_cost_flag = row[32]
    i.created_at = row[33]
    i.updated_at = row[34]
  end
end