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
