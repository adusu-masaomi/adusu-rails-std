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
