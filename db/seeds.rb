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


#quotation_headers
CSV.foreach('db/quotation_headers.csv') do |row|
  QuotationHeader.create do |q|
    q.id = row[0]
    q.quotation_code = row[1]
    q.invoice_code = row[2]
    q.delivery_slip_code = row[3]
    q.quotation_header_origin_id = row[4]
    q.quotation_date = row[5]
    q.construction_datum_id = row[6]
    q.construction_name = row[7]
    q.customer_id = row[8]
    q.customer_name = row[9]
    q.honorific_id = row[10]
    q.responsible1 = row[11]
    q.responsible2 = row[12]
    q.post = row[13]
    q.address = row[14]
    q.house_number = row[15]
    q.address2 = row[16]
    q.tel = row[17]
    q.fax = row[18]
    q.construction_period = row[19]
    q.construction_period_date1 = row[20]
    q.construction_period_date2 = row[21]
    q.construction_post = row[22]
    q.construction_place = row[23]
    q.construction_house_number = row[24]
    q.construction_place2 = row[25]
    q.trading_method = row[26]
    q.effective_period = row[27]
    q.quote_price = row[28]
    q.execution_amount = row[29]
    q.net_amount = row[30]
    q.last_line_number = row[31]
    q.category_saved_flag = row[32]
    q.category_saved_id = row[33]
    q.subcategory_saved_id = row[34]
    q.invoice_period_start_date = row[35]
    q.invoice_period_end_date = row[36]
    q.fixed_flag = row[37]
    q.not_sum_flag = row[38]
    q.created_at = row[39]
    q.updated_at = row[40]
  end
end

#quotation_material_details
CSV.foreach('db/quotation_material_details.csv') do |row|
  QuotationMaterialDetail.create do |q|
    q.id = row[0]
    q.quotation_material_header_id = row[1]
    q.material_id = row[2]
    q.material_code = row[3]
    q.material_name = row[4]
    q.maker_id = row[5]
    q.maker_name = row[6]
    q.quantity = row[7]
    q.unit_master_id = row[8]
    q.list_price = row[9]
    q.quotation_unit_price_1 = row[10]
    q.quotation_unit_price_2 = row[11]
    q.quotation_unit_price_3 = row[12]
    q.quotation_price_1 = row[13]
    q.quotation_price_2 = row[14]
    q.quotation_price_3 = row[15]
    q.bid_flag_1 = row[16]
    q.bid_flag_2 = row[17]
    q.bid_flag_3 = row[18]
    q.mail_sent_flag = row[19]
    q.quotation_email_flag_1 = row[20]
    q.quotation_email_flag_2 = row[21]
    q.quotation_email_flag_3 = row[22]
    q.order_email_flag_1 = row[23]
    q.order_email_flag_2 = row[24]
    q.order_email_flag_3 = row[25]
    q.sequential_id = row[26]
    q.created_at = row[27]
    q.updated_at = row[28]
  end
end

#quotation_material_headers
CSV.foreach('db/quotation_material_headers.csv') do |row|
  QuotationMaterialHeader.create do |q|
    q.id = row[0]
    q.quotation_code = row[1]
    q.requested_date = row[2]
    q.construction_datum_id = row[3]
    q.supplier_master_id = row[4]
    q.responsible = row[5]
    q.email = row[6]
    q.delivery_place_flag = row[7]
    q.notes_1 = row[8]
    q.notes_2 = row[9]
    q.notes_3 = row[10]
    q.quotation_header_origin_id = row[11]
    q.total_quotation_price_1 = row[12]
    q.total_quotation_price_2 = row[13]
    q.total_quotation_price_3 = row[14]
    q.total_order_price_1 = row[15]
    q.total_order_price_2 = row[16]
    q.total_order_price_3 = row[17]
    q.supplier_id_1 = row[18]
    q.supplier_id_2 = row[19]
    q.supplier_id_3 = row[20]
    q.supplier_responsible_id_1 = row[21]
    q.supplier_responsible_id_2 = row[22]
    q.supplier_responsible_id_3 = row[23]
    q.quotation_email_flag_1 = row[24]
    q.quotation_email_flag_2 = row[25]
    q.quotation_email_flag_3 = row[26]
    q.order_email_flag_1 = row[27]
    q.order_email_flag_2 = row[28]
    q.order_email_flag_3 = row[29]
    q.all_bid_flag_1 = row[30]
    q.all_bid_flag_2 = row[31]
    q.all_bid_flag_3 = row[32]
    q.created_at = row[33]
    q.updated_at = row[34]
  end
end

#sites
CSV.foreach('db/sites.csv') do |row|
  Site.create do |s|
    s.id = row[0]
    s.name = row[1]
    s.post = row[2]
    s.address = row[3]
    s.house_number = row[4]
    s.address2 = row[5]
    s.created_at = row[6]
    s.updated_at = row[7]
  end
end

#staffs
CSV.foreach('db/staffs.csv') do |row|
  Staff.create do |s|
    s.id = row[0]
    s.staff_name = row[1]
    s.furigana = row[2]
    s.affiliation_id = row[3]
    s.hourly_wage = row[4]
    s.daily_pay = row[5]
    s.supplier_master_id = row[6]
    s.created_at = row[7]
    s.updated_at = row[8]
  end
end

#stocktakes
CSV.foreach('db/stocktakes.csv') do |row|
  Stocktake.create do |s|
    s.id = row[0]
    s.stocktake_date = row[1]
    s.material_master_id = row[2]
    s.inventory_id = row[3]
    s.physical_quantity = row[4]
    s.unit_price = row[5]
    s.physical_amount = row[6]
    s.book_quantity = row[7]
    s.book_amount = row[8]
    s.inventory_update_flag = row[9]
    s.created_at = row[10]
    s.updated_at = row[11]
  end
end

#supplier_masters
CSV.foreach('db/supplier_masters.csv') do |row|
  SupplierMaster.create do |s|
    s.id = row[0]
    s.supplier_name = row[1]
    s.tel_main = row[2]
    s.fax_main = row[3]
    s.email_main = row[4]
    s.responsible1 = row[5]
    s.email1 = row[6]
    s.responsible2 = row[7]
    s.email2 = row[8]
    s.responsible3 = row[9]
    s.email3 = row[10]
    s.responsible_cc = row[11]
    s.email_cc = row[12]
    s.search_character = row[13]
    s.outsourcing_flag = row[14]
    s.post = row[15]
    s.address = row[16]
    s.bank_name = row[17]
    s.bank_branch_name = row[18]
    s.account_type = row[19]
    s.account_number = row[20]
    s.holder = row[21]
    s.responsible_title = row[22]
    s.responsible_name = row[23]
    s.created_at = row[24]
    s.updated_at = row[25]
  end
end

#supplier_responsibles
CSV.foreach('db/supplier_responsibles.csv') do |row|
  SupplierResponsible.create do |s|
    s.id = row[0]
    s.supplier_master_id = row[1]
    s.responsible_name = row[2]
    s.responsible_email = row[3]
    s.created_at = row[4]
    s.updated_at = row[5]
  end
end

#unit_masters
CSV.foreach('db/unit_masters.csv') do |row|
  UnitMaster.create do |u|
    u.id = row[0]
    u.unit_name = row[1]
    u.created_at = row[2]
    u.updated_at = row[3]
  end
end

#users
#CSV.foreach('db/users.csv') do |row|
#  User.create do |u|
#    u.id = row[0]
#    u.name = row[1]
#    u.email = row[2]
#    u.password_digest = row[3]
#    u.created_at = row[4]
#    u.updated_at = row[5]
#  end
#end

#working_categories
CSV.foreach('db/working_categories.csv') do |row|
  WorkingCategory.create do |w|
    w.id = row[0]
    w.category_name = row[1]
    w.seq = row[2]
    w.created_at = row[3]
    w.updated_at = row[4]
  end
end

#working_middle_items
CSV.foreach('db/working_middle_items.csv') do |row|
  WorkingMiddleItem.create do |w|
    w.id = row[0]
    w.working_middle_item_name = row[1]
    w.working_middle_item_short_name = row[2]
    w.working_middle_item_category_id = row[3]
    w.working_subcategory_id = row[4]
    w.working_middle_specification = row[5]
    w.working_unit_id = row[6]
    w.working_unit_name = row[7]
    w.working_unit_price = row[8]
    w.execution_unit_price = row[9]
    w.material_id = row[10]
    w.working_material_name = row[11]
    w.execution_material_unit_price = row[12]
    w.material_unit_price = row[13]
    w.execution_labor_unit_price = row[14]
    w.labor_unit_price = row[15]
    w.labor_unit_price_standard = row[16]
    w.labor_productivity_unit = row[17]
    w.labor_productivity_unit_total = row[18]
    w.material_quantity = row[19]
    w.accessory_cost = row[20]
    w.material_cost_total = row[21]
    w.labor_cost_total = row[22]
    w.other_cost = row[23]
    w.seq = row[24]
    w.created_at = row[25]
    w.updated_at = row[26]
  end
end

#working_safety_matters
CSV.foreach('db/working_safety_matters.csv') do |row|
  WorkingSafetyMatter.create do |w|
    w.id = row[0]
    w.working_safety_matter_name = row[1]
    w.created_at = row[2]
    w.updated_at = row[3]
  end
end
