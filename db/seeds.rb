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


#inventory_histories
CSV.foreach('db/inventory_histories.csv') do |row|
  InventoryHistory.create do |i|
    i.id = row[0]
    i.inventory_date = row[1]
    i.inventory_division_id = row[2]
    i.construction_datum_id = row[3]
    i.material_master_id = row[4]
    i.quantity = row[5]
    i.inventory_quantity = row[6]
    i.unit_master_id = row[7]
    i.unit_price = row[8]
    i.price = row[9]
    i.supplier_master_id = row[10]
    i.slip_code = row[11]
    i.purchase_datum_id = row[12]
    i.previous_quantity = row[13]
    i.previous_unit_price = row[14]
    i.current_quantity = row[15]
    i.current_unit_price = row[16]
    i.current_history_id = row[17]
    i.current_warehousing_date = row[18]
    i.next_quantity_1 = row[19]
    i.next_unit_price_1 = row[20]
    i.next_history_id_1 = row[21]
    i.next_warehousing_date_1 = row[22]
    i.created_at = row[23]
    i.updated_at = row[24]
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

#invoice_headers
CSV.foreach('db/invoice_headers.csv') do |row|
  InvoiceHeader.create do |i|
    i.id = row[0]
    i.invoice_code = row[1]
    i.quotation_code = row[2]
    i.delivery_slip_code = row[3]
    i.invoice_date = row[4]
    i.construction_datum_id = row[5]
    i.construction_name = row[6]
    i.customer_id = row[7]
    i.customer_name = row[8]
    i.honorific_id = row[9]
    i.responsible1 = row[10]
    i.responsible2 = row[11]
    i.post = row[12]
    i.address = row[13]
    i.house_number = row[14]
    i.address2 = row[15]
    i.tel = row[16]
    i.fax = row[17]
    i.construction_period = row[18]
    i.construction_place = row[19]
    i.construction_house_number = row[20]
    i.construction_place2 = row[21]
    i.payment_period = row[22]
    i.invoice_period_start_date = row[23]
    i.invoice_period_end_date = row[24]
    i.billing_amount = row[25]
    i.execution_amount = row[26]
    i.deposit_amount = row[27]
    i.payment_method_id = row[28]
    i.commission = row[29]
    i.payment_date = row[30]
    i.labor_insurance_not_flag = row[31]
    i.last_line_number = row[32]
    i.remarks = row[33]
    i.final_return_division = row[34]
    i.deposit_complete_flag = row[35]
    i.created_at = row[36]
    i.updated_at = row[37]
  end
end

#maker_masters
CSV.foreach('db/maker_masters.csv') do |row|
  MakerMaster.create do |m|
    m.id = row[0]
    m.maker_name = row[1]
    m.created_at = row[2]
    m.updated_at = row[3]
  end
end

#material_categories
CSV.foreach('db/material_categories.csv') do |row|
  MaterialCategory.create do |m|
    m.id = row[0]
    m.name = row[1]
    m.seq = row[2]
    m.created_at = row[3]
    m.updated_at = row[4]
  end
end
