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


#material_masters
CSV.foreach('db/material_masters.csv') do |row|
  MaterialMaster.create do |m|
    m.id = row[0]
    m.material_code = row[1]
    m.internal_code = row[2]
    m.material_name = row[3]
    m.maker_id = row[4]
    m.unit_id = row[5]
    m.list_price = row[6]
    m.list_price_quotation = row[7]
    m.standard_quantity = row[8]
    m.standard_labor_productivity_unit = row[9]
    m.standard_rate = row[10]
    m.last_unit_price = row[11]
    m.last_unit_price_update_at = row[12]
    m.inventory_category_id = row[13]
    m.material_category_id = row[14]
    m.list_price_update_at = row[15]
    m.notes = row[16]
    m.created_at = row[17]
    m.updated_at = row[18]
  end
end

#orders
CSV.foreach('db/orders.csv') do |row|
  Order.create do |o|
    o.id = row[0]
    o.purchase_order_history_id = row[1]
    o.material_id = row[2]
    o.material_code = row[3]
    o.material_name = row[4]
    o.maker_id = row[5]
    o.maker_name = row[6]
    o.quantity = row[7]
    o.unit_master_id = row[8]
    o.list_price = row[9]
    o.order_unit_price = row[10]
    o.order_price = row[11]
    o.material_category_id = row[12]
    o.mail_sent_flag = row[13]
    o.delivery_complete_flag = row[14]
    o.sequential_id = row[15]
    o.created_at = row[16]
    o.updated_at = row[17]
  end
end

#outsourcing_costs
CSV.foreach('db/outsourcing_costs.csv') do |row|
  OutsourcingCost.create do |o|
    o.id = row[0]
    o.invoice_code = row[1]
    o.purchase_order_datum_id = row[2]
    o.construction_datum_id = row[3]
    o.staff_id = row[4]
    o.supplier_master_id = row[5]
    o.working_start_date = row[6]
    o.working_end_date = row[7]
    o.purchase_amount = row[8]
    o.supplies_expense = row[9]
    o.labor_cost = row[10]
    o.misellaneous_expense = row[11]
    o.execution_amount = row[12]
    o.billing_amount = row[13]
    o.purchase_order_amount = row[14]
    o.closing_date = row[15]
    o.source_bank_id = row[16]
    o.payment_amount = row[17]
    o.unpaid_amount = row[18]
    o.payment_due_date = row[19]
    o.payment_date = row[20]
    o.unpaid_payment_date = row[21]
    o.created_at = row[22]
    o.updated_at = row[23]
  end
end
