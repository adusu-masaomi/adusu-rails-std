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