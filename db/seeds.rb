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

#最新必須
#delivery_slip_detail_middle_classifications
CSV.foreach('db/delivery_slip_detail_middle_classifications.csv') do |row|
  DeliverySlipDetailMiddleClassification.create do |d|
    d.id = row[0]
    d.delivery_slip_header_id = row[1]
    d.delivery_slip_detail_large_classification_id = row[2]
    d.delivery_slip_item_division_id = row[3]
    d.working_middle_item_id = row[4]
    d.working_specific_middle_item_id = row[5]
    d.working_middle_item_name = row[6]
    d.working_middle_item_short_name = row[7]
    d.working_middle_item_category_id = row[8]
    d.working_middle_item_category_id_call = row[9]
    d.working_middle_item_subcategory_id = row[10]
    d.working_middle_item_subcategory_id_call = row[11]
    d.line_number = row[12]
    d.working_middle_specification = row[13]
    d.quantity = row[14]
    d.execution_quantity = row[15]
    d.working_unit_id = row[16]
    d.working_unit_name = row[17]
    d.working_unit_price = row[18]
    d.delivery_slip_price = row[19]
    d.execution_unit_price = row[20]
    d.execution_price = row[21]
    d.material_id = row[22]
    d.working_material_name = row[23]
    d.material_unit_price = row[24]
    d.labor_unit_price = row[25]
    d.labor_productivity_unit = row[26]
    d.labor_productivity_unit_total = row[27]
    d.material_quantity = row[28]
    d.accessory_cost = row[29]
    d.material_cost_total = row[30]
    d.labor_cost_total = row[31]
    d.other_cost = row[32]
    d.remarks = row[33]
    d.construction_type = row[34]
    d.piping_wiring_flag = row[35]
    d.equipment_mounting_flag = row[36]
    d.labor_cost_flag = row[37]
    d.created_at = row[38]
    d.updated_at = row[39]
  end
end

#最新必須
#delivery_slip_headers
CSV.foreach('db/delivery_slip_headers.csv') do |row|
  DeliverySlipHeader.create do |d|
    d.id = row[0]
    d.delivery_slip_code = row[1]
    d.quotation_code = row[2]
    d.invoice_code = row[3]
    d.delivery_slip_header_origin_id = row[4]
    d.delivery_slip_date = row[5]
    d.construction_datum_id = row[6]
    d.construction_name = row[7]
    d.customer_id = row[8]
    d.customer_name = row[9]
    d.honorific_id = row[10]
    d.responsible1 = row[11]
    d.responsible2 = row[12]
    d.post = row[13]
    d.address = row[14]
    d.house_number = row[15]
    d.address2 = row[16]
    d.tel = row[17]
    d.fax = row[18]
    d.construction_period = row[19]
    d.construction_period_date1 = row[20]
    d.construction_period_date2 = row[21]
    d.construction_post = row[22]
    d.construction_place = row[23]
    d.construction_house_number = row[24]
    d.construction_place2 = row[25]
    d.delivery_amount = row[26]
    d.execution_amount = row[27]
    d.last_line_number = row[28]
    d.category_saved_flag = row[29]
    d.category_saved_id = row[30]
    d.subcategory_saved_id = row[31]
    d.fixed_flag = row[32]
    d.final_return_division = row[33]
    d.created_at = row[34]
    d.updated_at = row[35]
  end
end

#↓inventory～依頼中...

#inventories
CSV.foreach('db/inventories.csv') do |row|
  Inventory.create do |i|
    i.id = row[0]
    i.warehouse_id = row[1]
    i.location_id = row[2]
    i.material_master_id = row[3]
    i.inventory_quantity = row[4]
    i.unit_master_id = row[5]
    i.inventory_amount = row[6]
    i.supplier_master_id = row[7]
    i.current_history_id = row[8]
    i.current_warehousing_date = row[9]
    i.current_quantity = row[10]
    i.current_unit_price = row[11]
    i.last_warehousing_date = row[12]
    i.last_unit_price = row[13]
    i.next_history_id_1 = row[14]
    i.next_warehousing_date_1 = row[15]
    i.next_quantity_1 = row[16]
    i.next_unit_price_1 = row[17]
    i.next_history_id_2 = row[18]
    i.next_warehousing_date_2 = row[19]
    i.next_quantity_2 = row[20]
    i.next_unit_price_2 = row[21]
    i.no_stocktake_flag = row[22]
    i.image = row[23]
    i.created_at = row[24]
    i.updated_at = row[25]
  end
end

#inventory_categories
CSV.foreach('db/inventory_categories.csv') do |row|
  InventoryCategory.create do |i|
    i.id = row[0]
    i.name = row[1]
    i.seq = row[2]
    i.created_at = row[3]
    i.updated_at = row[4]
  end
end

