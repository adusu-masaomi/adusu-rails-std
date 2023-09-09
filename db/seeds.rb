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


#purchase_unit_prices
CSV.foreach('db/purchase_unit_prices.csv') do |row|
  PurchaseUnitPrice.create do |p|
    p.id = row[1], row[2]
    p.supplier_id = row[1]
    p.material_id = row[2]
    p.supplier_material_code = row[3]
    p.unit_price = row[4]
    p.list_price = row[5]
    p.unit_id = row[6]
    p.created_at = row[7]
    p.updated_at = row[8]
  end
end

#quotation_detail_large_classifications
CSV.foreach('db/quotation_detail_large_classifications.csv') do |row|
  QuotationDetailLargeClassification.create do |q|
    q.id = row[0]
    q.quotation_header_id = row[1]
    q.quotation_items_division_id = row[2]
    q.working_large_item_id = row[3]
    q.working_specific_middle_item_id = row[4]
    q.working_large_item_name = row[5]
    q.working_large_item_short_name = row[6]
    q.working_middle_item_category_id = row[7]
    q.working_middle_item_category_id_call = row[8]
    q.working_middle_item_subcategory_id = row[9]
    q.working_middle_item_subcategory_id_call = row[10]
    q.working_large_specification = row[11]
    q.line_number = row[12]
    q.quantity = row[13]
    q.execution_quantity = row[14]
    q.working_unit_id = row[15]
    q.working_unit_name = row[16]
    q.working_unit_price = row[17]
    q.quote_price = row[18]
    q.execution_unit_price = row[19]
    q.execution_price = row[20]
    q.labor_productivity_unit = row[21]
    q.labor_productivity_unit_total = row[22]
    q.last_line_number = row[23]
    q.remarks = row[24]
    q.construction_type = row[25]
    q.piping_wiring_flag = row[26]
    q.equipment_mounting_flag = row[27]
    q.labor_cost_flag = row[28]
    q.created_at = row[29]
    q.updated_at = row[30]
  end
end
