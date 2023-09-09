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


#purchase_divisions
CSV.foreach('db/purchase_divisions.csv') do |row|
  PurchaseDivision.create do |p|
    p.id = row[0]
    p.purchase_division_name = row[1]
    p.purchase_division_long_name = row[2]
    p.created_at = row[3]
    p.updated_at = row[4]
  end
end

#purchase_headers
CSV.foreach('db/purchase_headers.csv') do |row|
  PurchaseHeader.create do |p|
    p.id = row[0]
    p.slip_code = row[1]
    p.complete_flag = row[2]
    p.created_at = row[3]
    p.updated_at = row[4]
  end
end

#purchase_order_data
CSV.foreach('db/purchase_order_data.csv') do |row|
  PurchaseOrderDatum.create do |p|
    p.id = row[0]
    p.purchase_order_code = row[1]
    p.construction_datum_id = row[2]
    p.supplier_master_id = row[3]
    p.supplier_responsible_id = row[4]
    p.alias_name = row[5]
    p.purchase_order_date = row[6]
    p.mail_sent_flag = row[7]
    p.created_at = row[8]
    p.updated_at = row[9]
  end
end

#purchase_order_histories
CSV.foreach('db/purchase_order_histories.csv') do |row|
  PurchaseOrderHistory.create do |p|
    p.id = row[0]
    p.purchase_order_date = row[1]
    p.supplier_master_id = row[2]
    p.purchase_order_datum_id = row[3]
    p.mail_sent_flag = row[4]
    p.delivery_place_flag = row[5]
    p.notes = row[6]
    p.created_at = row[7]
    p.updated_at = row[8]
  end
end
