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


#quotation_detail_middle_classifications
CSV.foreach('db/quotation_detail_middle_classifications.csv') do |row|
  QuotationDetailMiddleClassification.create do |q|
    q.id = row[0]
    q.quotation_header_id = row[1]
    q.quotation_detail_large_classification_id = row[2]
    q.quotation_items_division_id = row[3]
    q.working_middle_item_id = row[4]
    q.working_specific_middle_item_id = row[5]
    q.working_middle_item_name = row[6]
    q.working_middle_item_short_name = row[7]
    q.working_middle_item_category_id = row[8]
    q.working_middle_item_category_id_call = row[9]
    q.working_middle_item_subcategory_id = row[10]
    q.working_middle_item_subcategory_id_call = row[11]
    q.line_number = row[12]
    q.working_middle_specification = row[13]
    q.quantity = row[14]
    q.execution_quantity = row[15]
    q.working_unit_id = row[16]
    q.working_unit_name = row[17]
    q.working_unit_price = row[18]
    q.quote_price = row[19]
    q.execution_unit_price = row[20]
    q.execution_price = row[21]
    q.material_id = row[22]
    q.quotation_material_name = row[23]
    q.material_unit_price = row[24]
    q.labor_unit_price = row[25]
    q.labor_productivity_unit = row[26]
    q.labor_productivity_unit_total = row[27]
    q.material_quantity = row[28]
    q.accessory_cost = row[29]
    q.material_cost_total = row[30]
    q.labor_cost_total = row[31]
    q.other_cost = row[32]
    q.remarks = row[33]
    q.construction_type = row[34]
    q.piping_wiring_flag = row[35]
    q.equipment_mounting_flag = row[36]
    q.labor_cost_flag = row[37]
    q.created_at = row[38]
    q.updated_at = row[39]
  end
end
