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

#affiliations
CSV.foreach('db/affiliations.csv') do |row|
  Affiliation.create do |a|
    a.id = row[0]
    a.affiliation_name = row[1]
    a.created_at = row[2]
    a.updated_at = row[3]
  end
end

#business_holidays
CSV.foreach('db/business_holidays.csv') do |row|
  BusinessHoliday.create do |b|
    b.id = row[0]
    b.working_date = row[1]
    b.holiday_flag = row[2]
    b.created_at = row[3]
    b.updated_at = row[4]
  end
end

#最新必須
#constants
CSV.foreach('db/constants.csv') do |row|
  Constant.create do |c|
    c.id = row[0]
    c.purchase_order_last_header_code = row[1]
    c.created_at = row[2]
    c.updated_at = row[3]
  end
end

#移行無し
#construction_attachments
#CSV.foreach('db/construction_attachments.csv') do |row|
#  ConstructionAttachment.create do |c|
#    c.id = row[0]
#    c.construction_datum_id = row[1]
#    c.title = row[2]
#    c.attachment = row[3]
#    c.created_at = row[4]
#    c.updated_at = row[5]
#  end
#end

#最新必須
#construction_costs
CSV.foreach('db/construction_costs.csv') do |row|
  ConstructionCost.create do |c|
    c.id = row[0]
    c.construction_datum_id = row[1]
    c.purchase_amount = row[2]
    c.supplies_expense = row[3]
    c.labor_cost = row[4]
    c.misellaneous_expense = row[5]
    c.execution_amount = row[6]
    c.constructing_amount = row[7]
    c.purchase_order_amount = row[8]
    c.final_return_division = row[9]
    c.created_at = row[10]
    c.updated_at = row[11]
  end
end

#最新必須
#construction_daily_reports
CSV.foreach('db/construction_daily_reports.csv') do |row|
  ConstructionDailyReport.create do |c|
    c.id = row[0]
    c.working_date = row[1]
    c.construction_datum_id = row[2]
    c.staff_id = row[3]
    c.start_time_1 = row[4]
    c.end_time_1 = row[5]
    c.start_time_2 = row[6]
    c.end_time_2 = row[7]
    c.working_times = row[8]
    c.man_month = row[9]
    c.labor_cost = row[10]
    c.working_details = row[11]
    c.is_one_day_work = row[12]
    c.is_no_break_time_1 = row[13]
    c.is_no_break_time_2 = row[14]
    c.is_no_break_time_3 = row[15]
    c.created_at = row[16]
    c.updated_at = row[17]
  end
end

