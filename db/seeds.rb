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
#construction_data
CSV.foreach('db/construction_data.csv') do |row|
  ConstructionDatum.create do |c|
    c.id = row[0]
    c.construction_code = row[1]
    c.construction_name = row[2]
    c.alias_name = row[3]
    c.reception_date = row[4]
    c.customer_id = row[5]
    c.personnel = row[6]
    c.site_id = row[7]
    c.construction_start_date = row[8]
    c.construction_end_date = row[9]
    c.construction_period_start = row[10]
    c.construction_period_end = row[11]
    c.post = row[12]
    c.address = row[13]
    c.house_number = row[14]
    c.address2 = row[15]
    c.latitude = row[16]
    c.longitude = row[17]
    c.construction_detail = row[18]
    c.attention_matter = row[19]
    c.working_safety_matter_id = row[20]
    c.working_safety_matter_name = row[21]
    c.estimated_amount = row[22]
    c.final_amount = row[23]
    c.billing_due_date = row[24]
    c.deposit_due_date = row[25]
    c.deposit_date = row[26]
    c.quotation_header_id = row[27]
    c.delivery_slip_header_id = row[28]
    c.billed_flag = row[29]
    c.calculated_flag = row[30]
    c.order_flag = row[31]
    c.quotation_flag = row[32]
    c.created_at = row[33]
    c.updated_at = row[34]
  end
end

#contacts
CSV.foreach('db/contacts.csv') do |row|
  Contact.create do |c|
    c.id = row[0]
    c.name = row[1]
    c.search_character = row[2]
    c.company_name = row[3]
    c.affiliation = row[4]
    c.department = row[5]
    c.post = row[6]
    c.address = row[7]
    c.tel = row[8]
    c.fax = row[9]
    c.email = row[10]
    c.url = row[11]
    c.partner_division_id = row[12]
    c.created_at = row[13]
    c.updated_at = row[14]
  end
end

#最新必須
#customer_masters
CSV.foreach('db/customer_masters.csv') do |row|
  CustomerMaster.create do |c|
    c.id = row[0]
    c.customer_name = row[1]
    c.search_character = row[2]
    c.post = row[3]
    c.address = row[4]
    c.house_number = row[5]
    c.address2 = row[6]
    c.tel_main = row[7]
    c.fax_main = row[8]
    c.email_main = row[9]
    c.closing_date = row[10]
    c.closing_date_division = row[11]
    c.due_date = row[12]
    c.due_date_division = row[13]
    c.honorific_id = row[14]
    c.responsible1 = row[15]
    c.responsible2 = row[16]
    c.contact_id = row[17]
    c.payment_bank_id = row[18]
    c.card_not_flag = row[19]
    c.contractor_flag = row[20]
    c.public_flag = row[21]
    c.created_at = row[22]
    c.updated_at = row[23]
  end
end
