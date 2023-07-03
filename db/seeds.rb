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
CSV.foreach('db/supplier_masters.csv') do |row|
  SupplierMaster.create(:supplier_name => row[0], :tel_main => row[1])
end

#render
CSV.foreach('db/customer_masters.csv') do |row|
  #CustomerMaster.create(:customer_name => row[0], :post => row[1], :address => row[2], :house_number => row[3], :tel_main => row[4])
  CustomerMaster.create(:customer_name => row[0], :tel_main => row[2])
end

#render
CSV.foreach('db/material_masters.csv') do |row|
  MaterialMaster.create(:material_code => row[0], :material_name => row[1], :maker_id => row[2], :unit_id => row[3], :list_price => row[4], :list_price_quotation => row[5])
end

#render
CSV.foreach('db/material_categories.csv') do |row|
  MaterialCategory.create(:name => row[0])
end

#render
CSV.foreach('db/inventory_categories.csv') do |row|
  InventoryCategory.create(:name => row[0])
end

#render
CSV.foreach('db/supplier_responsibles.csv') do |row|
  SupplierResponsible.create(:supplier_master_id => row[0], :responsible_name => row[1])
end

######################

#render
CSV.foreach('db/unit_masters.csv') do |row|
  UnitMaster.create(:unit_name => row[0])
end

#render
CSV.foreach('db/purchase_divisions.csv') do |row|
  PurchaseDivision.create(:purchase_division_name => row[0], :purchase_division_long_name => row[1])
end

#render
CSV.foreach('db/staffs.csv') do |row|
  Staff.create(:staff_name => row[0], :furigana => row[1], :affiliation_id => row[2])
end


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

