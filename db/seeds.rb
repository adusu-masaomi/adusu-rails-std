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

#render
#CSV.foreach('db/makers.csv') do |row|
# MakerMaster.create(:maker_name => row[0])
#end

#render
#CSV.foreach('db/supplier_masters.csv') do |row|
#  SupplierMaster.create(:supplier_name => row[0], :tel_main => row[1])
#end

#render
#得意先Mはバリデーションで引っかかるので使用しない(保留...)
##CSV.foreach('db/customer_masters.csv') do |row|
##  #CustomerMaster.create(:customer_name => row[0], :post => row[1], :address => row[2], :house_number => row[3], :tel_main => row[4])
##  CustomerMaster.create(:customer_name => row[0], :tel_main => row[2])
##end

#render
#CSV.foreach('db/material_masters.csv') do |row|
#  MaterialMaster.create(:material_code => row[0], :material_name => row[1], :maker_id => row[2], :unit_id => row[3], :list_price => row[4], :list_price_quotation => row[5])
#end

#render
#CSV.foreach('db/material_categories.csv') do |row|
#  MaterialCategory.create(:name => row[0])
#end

#render
#CSV.foreach('db/inventory_categories.csv') do |row|
#  InventoryCategory.create(:name => row[0])
#end

#render
#CSV.foreach('db/supplier_responsibles.csv') do |row|
#  SupplierResponsible.create(:supplier_master_id => row[0], :responsible_name => row[1])
#end

#render
#CSV.foreach('db/unit_masters.csv') do |row|
#  UnitMaster.create(:unit_name => row[0])
#end

#render
#CSV.foreach('db/purchase_divisions.csv') do |row|
#  PurchaseDivision.create(:purchase_division_name => row[0], :purchase_division_long_name => row[1])
#end

#社員
#CSV.foreach('db/staffs.csv') do |row|
#  Staff.create(:staff_name => row[0], :furigana => row[1], :affiliation_id => row[2], :daily_pay => row[3])
#end

#render
#CSV.foreach('db/affiliations.csv') do |row|
#  Affiliation.create(:affiliation_name => row[0])
#end

#render
#会社
#CSV.foreach('db/companies.csv') do |row|
#  Company.create(:name => row[0], :representative_title => row[1], :representative_name => row[2], :post => row[3], :address => row[4] ,
#                 :house_number => row[5], :tel => row[6], :fax => row[7], :invoice_number => row[8], :estimate_material_cost_rate => row[9],
#                 :estimate_execution_labor_cost => row[10], :estimate_labor_cost => row[11] )
#end

#render
#CSV.foreach('db/working_times.csv') do |row|
#  WorkingTime.create(:working_time_start_time => row[0], :working_time_end_time => row[1], :overtime_start_time => row[2], :overtime_end_time => row[3], 
#                 :overtime_early_start_time => row[4] ,:overtime_early_end_time => row[5], :overtime_midnight_start_time => row[6], :overtime_midnight_end_time => row[7], 
#                 :break_time_1_start_time => row[8], :break_time_1_end_time => row[9], :break_time_2_start_time => row[10], :break_time_2_end_time => row[11], 
#                 :break_time_3_start_time => row[12], :break_time_3_end_time => row[13])
#end


#工事データ
#CSV.foreach('db/construction_data.csv') do |row|
#  ConstructionDatum.create(:construction_code => row[0], :construction_name => row[1], :alias_name => row[2], :reception_date => row[3], 
#                 :customer_id => row[4] ,:construction_start_date => row[5], :construction_start_date => row[6], :construction_period_start => row[7], 
#                 :construction_period_end => row[8])
#end

#在庫データ
#CSV.foreach('db/inventories.csv') do |row|
#  Inventory.create(:warehouse_id => row[0], :location_id => row[1], :material_master_id => row[2], :inventory_quantity => row[3], 
#                 :unit_master_id => row[4] ,:inventory_amount => row[5], :supplier_master_id => row[6], :current_quantity => row[7], 
#                 :current_unit_price => row[8], :last_unit_price => row[9])
#end

#見積～納品用

#作業単位
#CSV.foreach('db/working_units.csv') do |row|
#  WorkingUnit.create(:working_unit_name => row[0], :seq => row[1])
#end

#作業カテゴリ
#CSV.foreach('db/working_categories.csv') do |row|
#  WorkingCategory.create(:category_name => row[0])
#end

#作業明細
#CSV.foreach('db/working_middle_items.csv') do |row|
#  WorkingMiddleItem.create(:working_middle_item_name => row[0], :working_middle_item_category_id => row[1],
#                           :working_unit_id => row[2], :working_unit_name => row[3] )
#end

######################

#CSV.foreach('db/material_list_price_update_since_201710.csv') do |row|
# @material_master = MaterialMaster.where(material_code:  row[0]).first
# if @material_master.present?
#   material_params = {list_price: row[1].to_i, list_price_update_at: update_date }
#   @material_master.update(material_params)
# end 
#end

#del180329
#CSV.foreach('db/contact.csv') do |row|
# Contact.create(:name => row[0], :company_name => row[1], :affiliation => row[2], :department => row[3], :post => row[4], :address => row[5], 
# :tel => row[6], :fax => row[7], :email => row[8], :url => row[9], :partner_division_id => row[10].to_i )
#end

