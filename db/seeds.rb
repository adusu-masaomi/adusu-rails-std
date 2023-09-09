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


#purchase_data
CSV.foreach('db/purchase_data.csv') do |row|
  PurchaseDatum.create do |p|
    p.id = row[0]
    p.purchase_date = row[1]
    p.slip_code = row[2]
    p.purchase_order_datum_id = row[3]
    p.construction_datum_id = row[4]
    p.material_id = row[5]
    p.material_code = row[6]
    p.material_name = row[7]
    p.maker_id = row[8]
    p.maker_name = row[9]
    p.quantity = row[10]
    p.quantity2 = row[11]
    p.unit_id = row[12]
    p.purchase_unit_price = row[13]
    p.purchase_unit_price2 = row[14]
    p.purchase_amount = row[15]
    p.list_price = row[16]
    p.purchase_id = row[17]
    p.division_id = row[18]
    p.supplier_id = row[19]
    p.inventory_division_id = row[20]
    p.unit_price_not_update_flag = row[21]
    p.outsourcing_invoice_flag = row[22]
    p.outsourcing_payment_flag = row[23]
    p.purchase_header_id = row[24]
    p.working_end_date = row[25]
    p.closing_date = row[26]
    p.payment_due_date = row[27]
    p.payment_date = row[28]
    p.unpaid_payment_date = row[29]
    p.notes = row[30]
    p.created_at = row[31]
    p.updated_at = row[32]
  end
end
