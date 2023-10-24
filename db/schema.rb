# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_10_24_000522) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "affiliations", id: :serial, force: :cascade do |t|
    t.string "affiliation_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "business_holidays", id: :serial, force: :cascade do |t|
    t.date "working_date"
    t.integer "holiday_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "representative_title"
    t.string "representative_name"
    t.string "post"
    t.string "address"
    t.string "house_number"
    t.string "address2"
    t.string "tel"
    t.string "fax"
    t.string "email"
    t.string "invoice_number"
    t.float "estimate_material_cost_rate"
    t.integer "estimate_execution_labor_cost"
    t.integer "estimate_labor_cost"
    t.string "responsible_order"
    t.string "responsible_estimate"
    t.string "responsible_invoice"
    t.string "responsible_delivery"
    t.string "bank_name_1"
    t.string "bank_branch_name_1"
    t.integer "account_type_1"
    t.string "account_number_1"
    t.string "holder_1"
    t.string "bank_name_2"
    t.string "bank_branch_name_2"
    t.integer "account_type_2"
    t.string "account_number_2"
    t.string "holder_2"
    t.string "bank_name_3"
    t.string "bank_branch_name_3"
    t.integer "account_type_3"
    t.string "account_number_3"
    t.string "holder_3"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "constants", id: :serial, force: :cascade do |t|
    t.string "purchase_order_last_header_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "construction_attachments", id: :serial, force: :cascade do |t|
    t.integer "construction_datum_id"
    t.string "title"
    t.string "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "construction_costs", id: :serial, force: :cascade do |t|
    t.integer "construction_datum_id"
    t.integer "purchase_amount"
    t.integer "supplies_expense"
    t.integer "labor_cost"
    t.integer "misellaneous_expense"
    t.integer "execution_amount"
    t.integer "constructing_amount"
    t.string "purchase_order_amount"
    t.integer "final_return_division"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "construction_daily_reports", id: :serial, force: :cascade do |t|
    t.date "working_date"
    t.integer "construction_datum_id"
    t.integer "staff_id"
    t.time "start_time_1"
    t.time "end_time_1"
    t.time "start_time_2"
    t.time "end_time_2"
    t.integer "working_times"
    t.decimal "man_month"
    t.integer "labor_cost"
    t.string "working_details"
    t.integer "is_one_day_work"
    t.integer "is_no_break_time_1"
    t.integer "is_no_break_time_2"
    t.integer "is_no_break_time_3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "construction_data", id: :serial, force: :cascade do |t|
    t.string "construction_code"
    t.string "construction_name"
    t.string "alias_name"
    t.date "reception_date"
    t.integer "customer_id"
    t.string "personnel"
    t.integer "site_id"
    t.date "construction_start_date"
    t.date "construction_end_date"
    t.date "construction_period_start"
    t.date "construction_period_end"
    t.string "post"
    t.string "address"
    t.string "house_number"
    t.string "address2"
    t.decimal "latitude"
    t.decimal "longitude"
    t.string "construction_detail"
    t.string "attention_matter"
    t.integer "working_safety_matter_id"
    t.string "working_safety_matter_name"
    t.integer "estimated_amount"
    t.integer "final_amount"
    t.date "billing_due_date"
    t.date "deposit_due_date"
    t.date "deposit_date"
    t.integer "quotation_header_id"
    t.integer "delivery_slip_header_id"
    t.integer "billed_flag"
    t.integer "calculated_flag"
    t.integer "order_flag"
    t.integer "quotation_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "search_character"
    t.string "company_name"
    t.string "affiliation"
    t.string "department"
    t.string "post"
    t.string "address"
    t.string "tel"
    t.string "fax"
    t.string "email"
    t.string "url"
    t.integer "partner_division_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customer_masters", id: :serial, force: :cascade do |t|
    t.string "customer_name"
    t.string "search_character"
    t.string "post"
    t.string "address"
    t.string "house_number"
    t.string "address2"
    t.string "tel_main"
    t.string "fax_main"
    t.string "email_main"
    t.integer "closing_date"
    t.integer "closing_date_division"
    t.integer "due_date"
    t.integer "due_date_division"
    t.integer "honorific_id"
    t.string "responsible1"
    t.string "responsible2"
    t.integer "contact_id"
    t.integer "payment_bank_id"
    t.integer "card_not_flag"
    t.integer "contractor_flag"
    t.integer "public_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivery_slip_detail_large_classifications", id: :serial, force: :cascade do |t|
    t.integer "delivery_slip_header_id"
    t.integer "delivery_slip_items_division_id"
    t.integer "working_large_item_id"
    t.integer "working_specific_middle_item_id"
    t.string "working_large_item_name"
    t.string "working_large_item_short_name"
    t.integer "working_middle_item_category_id"
    t.integer "working_middle_item_category_id_call"
    t.integer "working_middle_item_subcategory_id"
    t.integer "working_middle_item_subcategory_id_call"
    t.string "working_large_specification"
    t.integer "line_number"
    t.decimal "quantity", precision: 11, scale: 2
    t.decimal "execution_quantity", precision: 11, scale: 2
    t.integer "working_unit_id"
    t.string "working_unit_name"
    t.integer "working_unit_price"
    t.integer "delivery_slip_price"
    t.integer "execution_unit_price"
    t.integer "execution_price"
    t.decimal "labor_productivity_unit", precision: 11, scale: 3
    t.decimal "labor_productivity_unit_total", precision: 11, scale: 3
    t.integer "last_line_number"
    t.string "remarks"
    t.integer "construction_type"
    t.integer "piping_wiring_flag"
    t.integer "equipment_mounting_flag"
    t.integer "labor_cost_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivery_slip_detail_middle_classifications", id: :serial, force: :cascade do |t|
    t.integer "delivery_slip_header_id"
    t.integer "delivery_slip_detail_large_classification_id"
    t.integer "delivery_slip_item_division_id"
    t.integer "working_middle_item_id"
    t.integer "working_specific_middle_item_id"
    t.string "working_middle_item_name"
    t.string "working_middle_item_short_name"
    t.integer "working_middle_item_category_id"
    t.integer "working_middle_item_category_id_call"
    t.integer "working_middle_item_subcategory_id"
    t.integer "working_middle_item_subcategory_id_call"
    t.integer "line_number"
    t.string "working_middle_specification"
    t.decimal "quantity", precision: 11, scale: 2
    t.decimal "execution_quantity", precision: 11, scale: 2
    t.integer "working_unit_id"
    t.string "working_unit_name"
    t.integer "working_unit_price"
    t.integer "delivery_slip_price"
    t.integer "execution_unit_price"
    t.integer "execution_price"
    t.integer "material_id"
    t.string "working_material_name"
    t.integer "material_unit_price"
    t.decimal "labor_unit_price", precision: 11, scale: 2
    t.decimal "labor_productivity_unit", precision: 11, scale: 3
    t.decimal "labor_productivity_unit_total", precision: 11, scale: 3
    t.integer "material_quantity"
    t.integer "accessory_cost"
    t.integer "material_cost_total"
    t.integer "labor_cost_total"
    t.integer "other_cost"
    t.string "remarks"
    t.integer "construction_type"
    t.integer "piping_wiring_flag"
    t.integer "equipment_mounting_flag"
    t.integer "labor_cost_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivery_slip_headers", id: :serial, force: :cascade do |t|
    t.string "delivery_slip_code"
    t.string "quotation_code"
    t.string "invoice_code"
    t.integer "delivery_slip_header_origin_id"
    t.date "delivery_slip_date"
    t.integer "construction_datum_id"
    t.string "construction_name"
    t.integer "customer_id"
    t.string "customer_name"
    t.integer "honorific_id"
    t.string "responsible1"
    t.string "responsible2"
    t.string "post"
    t.string "address"
    t.string "house_number"
    t.string "address2"
    t.string "tel"
    t.string "fax"
    t.string "construction_period"
    t.date "construction_period_date1"
    t.date "construction_period_date2"
    t.string "construction_post"
    t.string "construction_place"
    t.string "construction_house_number"
    t.string "construction_place2"
    t.integer "delivery_amount"
    t.integer "execution_amount"
    t.integer "last_line_number"
    t.integer "category_saved_flag"
    t.integer "category_saved_id"
    t.integer "subcategory_saved_id"
    t.integer "fixed_flag"
    t.integer "final_return_division"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", id: :serial, force: :cascade do |t|
    t.integer "warehouse_id"
    t.integer "location_id"
    t.integer "material_master_id"
    t.decimal "inventory_quantity", precision: 11, scale: 2
    t.integer "unit_master_id"
    t.integer "inventory_amount"
    t.integer "supplier_master_id"
    t.integer "current_history_id"
    t.date "current_warehousing_date"
    t.decimal "current_quantity", precision: 11, scale: 2
    t.decimal "current_unit_price", precision: 11, scale: 2
    t.date "last_warehousing_date"
    t.decimal "last_unit_price", precision: 11, scale: 2
    t.integer "next_history_id_1"
    t.date "next_warehousing_date_1"
    t.decimal "next_quantity_1", precision: 11, scale: 2
    t.decimal "next_unit_price_1", precision: 11, scale: 2
    t.integer "next_history_id_2"
    t.date "next_warehousing_date_2"
    t.decimal "next_quantity_2", precision: 11, scale: 2
    t.decimal "next_unit_price_2", precision: 11, scale: 2
    t.integer "no_stocktake_flag"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventory_categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "seq"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventory_histories", id: :serial, force: :cascade do |t|
    t.date "inventory_date"
    t.integer "inventory_division_id"
    t.integer "construction_datum_id"
    t.integer "material_master_id"
    t.decimal "quantity", precision: 11, scale: 2
    t.integer "inventory_quantity"
    t.integer "unit_master_id"
    t.decimal "unit_price", precision: 11, scale: 2
    t.integer "price"
    t.integer "supplier_master_id"
    t.string "slip_code"
    t.integer "purchase_datum_id"
    t.integer "previous_quantity"
    t.decimal "previous_unit_price", precision: 11, scale: 2
    t.decimal "current_quantity", precision: 11, scale: 2
    t.decimal "current_unit_price", precision: 11, scale: 2
    t.integer "current_history_id"
    t.date "current_warehousing_date"
    t.decimal "next_quantity_1", precision: 11, scale: 2
    t.decimal "next_unit_price_1", precision: 11, scale: 2
    t.integer "next_history_id_1"
    t.date "next_warehousing_date_1"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoice_detail_large_classifications", id: :serial, force: :cascade do |t|
    t.integer "invoice_header_id"
    t.integer "invoice_items_division_id"
    t.integer "working_large_item_id"
    t.string "working_large_item_name"
    t.string "working_large_item_short_name"
    t.string "working_large_specification"
    t.integer "line_number"
    t.decimal "quantity", precision: 11, scale: 2
    t.decimal "execution_quantity", precision: 11, scale: 2
    t.integer "working_unit_id"
    t.string "working_unit_name"
    t.integer "working_unit_price"
    t.integer "invoice_price"
    t.integer "execution_unit_price"
    t.integer "execution_price"
    t.decimal "labor_productivity_unit", precision: 11, scale: 3
    t.decimal "labor_productivity_unit_total", precision: 11, scale: 3
    t.integer "last_line_number"
    t.string "remarks"
    t.integer "delivery_slip_header_id"
    t.integer "construction_type"
    t.integer "piping_wiring_flag"
    t.integer "equipment_mounting_flag"
    t.integer "labor_cost_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoice_detail_middle_classifications", id: :serial, force: :cascade do |t|
    t.integer "invoice_header_id"
    t.integer "invoice_detail_large_classification_id"
    t.integer "invoice_item_division_id"
    t.integer "working_middle_item_id"
    t.string "working_middle_item_name"
    t.string "working_middle_item_short_name"
    t.integer "line_number"
    t.string "working_middle_specification"
    t.decimal "quantity", precision: 11, scale: 2
    t.decimal "execution_quantity", precision: 11, scale: 2
    t.integer "working_unit_id"
    t.string "working_unit_name"
    t.integer "working_unit_price"
    t.integer "invoice_price"
    t.integer "execution_unit_price"
    t.integer "execution_price"
    t.integer "material_id"
    t.string "working_material_name"
    t.integer "material_unit_price"
    t.float "labor_unit_price"
    t.decimal "labor_productivity_unit", precision: 11, scale: 3
    t.decimal "labor_productivity_unit_total", precision: 11, scale: 3
    t.integer "material_quantity"
    t.integer "accessory_cost"
    t.integer "material_cost_total"
    t.integer "labor_cost_total"
    t.integer "other_cost"
    t.string "remarks"
    t.integer "construction_type"
    t.integer "piping_wiring_flag"
    t.integer "equipment_mounting_flag"
    t.integer "labor_cost_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoice_headers", id: :serial, force: :cascade do |t|
    t.string "invoice_code"
    t.string "quotation_code"
    t.string "delivery_slip_code"
    t.date "invoice_date"
    t.integer "construction_datum_id"
    t.string "construction_name"
    t.integer "customer_id"
    t.string "customer_name"
    t.integer "honorific_id"
    t.string "responsible1"
    t.string "responsible2"
    t.string "post"
    t.string "address"
    t.string "house_number"
    t.string "address2"
    t.string "tel"
    t.string "fax"
    t.string "construction_period"
    t.string "construction_place"
    t.string "construction_house_number"
    t.string "construction_place2"
    t.string "payment_period"
    t.date "invoice_period_start_date"
    t.date "invoice_period_end_date"
    t.integer "billing_amount"
    t.integer "execution_amount"
    t.integer "deposit_amount"
    t.integer "payment_method_id"
    t.integer "commission"
    t.date "payment_date"
    t.integer "labor_insurance_not_flag"
    t.integer "last_line_number"
    t.string "remarks"
    t.integer "final_return_division"
    t.integer "deposit_complete_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "maker_masters", id: :serial, force: :cascade do |t|
    t.string "maker_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "material_categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "seq"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "material_masters", id: :serial, force: :cascade do |t|
    t.string "material_code"
    t.string "internal_code"
    t.string "material_name"
    t.integer "maker_id"
    t.integer "unit_id"
    t.integer "list_price"
    t.integer "list_price_quotation"
    t.integer "standard_quantity"
    t.decimal "standard_labor_productivity_unit", precision: 11, scale: 3
    t.decimal "standard_rate", precision: 11, scale: 4
    t.decimal "last_unit_price", precision: 11, scale: 2
    t.date "last_unit_price_update_at"
    t.integer "inventory_category_id"
    t.integer "material_category_id"
    t.date "list_price_update_at"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", id: :serial, force: :cascade do |t|
    t.integer "purchase_order_history_id"
    t.integer "material_id"
    t.string "material_code"
    t.string "material_name"
    t.integer "maker_id"
    t.string "maker_name"
    t.integer "quantity"
    t.integer "unit_master_id"
    t.integer "list_price"
    t.decimal "order_unit_price", precision: 11, scale: 2
    t.integer "order_price"
    t.integer "material_category_id"
    t.integer "mail_sent_flag"
    t.integer "delivery_complete_flag"
    t.integer "sequential_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "outsourcing_costs", id: :serial, force: :cascade do |t|
    t.string "invoice_code"
    t.integer "purchase_order_datum_id"
    t.integer "construction_datum_id"
    t.integer "staff_id"
    t.integer "supplier_master_id"
    t.date "working_start_date"
    t.date "working_end_date"
    t.integer "purchase_amount"
    t.integer "supplies_expense"
    t.integer "labor_cost"
    t.integer "misellaneous_expense"
    t.integer "execution_amount"
    t.integer "billing_amount"
    t.string "purchase_order_amount"
    t.date "closing_date"
    t.integer "source_bank_id"
    t.integer "payment_amount"
    t.integer "unpaid_amount"
    t.date "payment_due_date"
    t.date "payment_date"
    t.date "unpaid_payment_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchase_data", id: :serial, force: :cascade do |t|
    t.date "purchase_date"
    t.string "slip_code"
    t.integer "purchase_order_datum_id"
    t.integer "construction_datum_id"
    t.integer "material_id"
    t.string "material_code"
    t.string "material_name"
    t.integer "maker_id"
    t.string "maker_name"
    t.decimal "quantity", precision: 11, scale: 2
    t.decimal "quantity2", precision: 11, scale: 2
    t.integer "unit_id"
    t.decimal "purchase_unit_price", precision: 11, scale: 2
    t.decimal "purchase_unit_price2", precision: 11, scale: 2
    t.integer "purchase_amount"
    t.integer "list_price"
    t.integer "purchase_id"
    t.integer "division_id"
    t.integer "supplier_id"
    t.integer "inventory_division_id"
    t.integer "unit_price_not_update_flag"
    t.integer "outsourcing_invoice_flag"
    t.integer "outsourcing_payment_flag"
    t.integer "purchase_header_id"
    t.date "working_end_date"
    t.date "closing_date"
    t.date "payment_due_date"
    t.date "payment_date"
    t.date "unpaid_payment_date"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "purchase_unit_price_tax"
  end

  create_table "purchase_divisions", id: :serial, force: :cascade do |t|
    t.string "purchase_division_name"
    t.string "purchase_division_long_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchase_headers", id: :serial, force: :cascade do |t|
    t.string "slip_code"
    t.integer "complete_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchase_order_data", id: :serial, force: :cascade do |t|
    t.string "purchase_order_code"
    t.integer "construction_datum_id"
    t.integer "supplier_master_id"
    t.integer "supplier_responsible_id"
    t.string "alias_name"
    t.date "purchase_order_date"
    t.integer "mail_sent_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchase_order_histories", id: :serial, force: :cascade do |t|
    t.date "purchase_order_date"
    t.integer "supplier_master_id"
    t.integer "purchase_order_datum_id"
    t.integer "mail_sent_flag"
    t.integer "delivery_place_flag"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchase_unit_prices", id: :serial, force: :cascade do |t|
    t.integer "supplier_id"
    t.integer "material_id"
    t.string "supplier_material_code"
    t.decimal "unit_price", precision: 11, scale: 2
    t.integer "list_price"
    t.integer "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quatation_material_headers", id: :serial, force: :cascade do |t|
    t.string "quotation_code"
    t.date "requested_date"
    t.integer "construction_datum_id"
    t.integer "supplier_master_id"
    t.string "responsible"
    t.string "email"
    t.integer "delivery_place_flag"
    t.string "notes_1"
    t.string "notes_2"
    t.string "notes_3"
    t.integer "quotation_header_origin_id"
    t.integer "total_quotation_price_1"
    t.integer "total_quotation_price_2"
    t.integer "total_quotation_price_3"
    t.integer "total_order_price_1"
    t.integer "total_order_price_2"
    t.integer "total_order_price_3"
    t.integer "supplier_id_1"
    t.integer "supplier_id_2"
    t.integer "supplier_id_3"
    t.integer "supplier_responsible_id_1"
    t.integer "supplier_responsible_id_2"
    t.integer "supplier_responsible_id_3"
    t.integer "quotation_email_flag_1"
    t.integer "quotation_email_flag_2"
    t.integer "quotation_email_flag_3"
    t.integer "order_email_flag_1"
    t.integer "order_email_flag_2"
    t.integer "order_email_flag_3"
    t.integer "all_bid_flag_1"
    t.integer "all_bid_flag_2"
    t.integer "all_bid_flag_3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotation_detail_large_classifications", id: :serial, force: :cascade do |t|
    t.integer "quotation_header_id"
    t.integer "quotation_items_division_id"
    t.integer "working_large_item_id"
    t.integer "working_specific_middle_item_id"
    t.string "working_large_item_name"
    t.string "working_large_item_short_name"
    t.integer "working_middle_item_category_id"
    t.integer "working_middle_item_category_id_call"
    t.integer "working_middle_item_subcategory_id"
    t.integer "working_middle_item_subcategory_id_call"
    t.string "working_large_specification"
    t.integer "line_number"
    t.decimal "quantity", precision: 11, scale: 2
    t.decimal "execution_quantity", precision: 11, scale: 2
    t.integer "working_unit_id"
    t.string "working_unit_name"
    t.integer "working_unit_price"
    t.integer "quote_price"
    t.integer "execution_unit_price"
    t.integer "execution_price"
    t.decimal "labor_productivity_unit", precision: 11, scale: 3
    t.decimal "labor_productivity_unit_total", precision: 11, scale: 3
    t.integer "last_line_number"
    t.string "remarks"
    t.integer "construction_type"
    t.integer "piping_wiring_flag"
    t.integer "equipment_mounting_flag"
    t.integer "labor_cost_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotation_detail_middle_classifications", id: :serial, force: :cascade do |t|
    t.integer "quotation_header_id"
    t.integer "quotation_detail_large_classification_id"
    t.integer "quotation_items_division_id"
    t.integer "working_middle_item_id"
    t.integer "working_specific_middle_item_id"
    t.string "working_middle_item_name"
    t.string "working_middle_item_short_name"
    t.integer "working_middle_item_category_id"
    t.integer "working_middle_item_category_id_call"
    t.integer "working_middle_item_subcategory_id"
    t.integer "working_middle_item_subcategory_id_call"
    t.integer "line_number"
    t.string "working_middle_specification"
    t.integer "quantity"
    t.integer "execution_quantity"
    t.integer "working_unit_id"
    t.string "working_unit_name"
    t.integer "working_unit_price"
    t.integer "quote_price"
    t.integer "execution_unit_price"
    t.integer "execution_price"
    t.integer "material_id"
    t.string "quotation_material_name"
    t.integer "material_unit_price"
    t.float "labor_unit_price"
    t.float "labor_productivity_unit"
    t.float "labor_productivity_unit_total"
    t.integer "material_quantity"
    t.integer "accessory_cost"
    t.integer "material_cost_total"
    t.integer "labor_cost_total"
    t.integer "other_cost"
    t.string "remarks"
    t.integer "construction_type"
    t.integer "piping_wiring_flag"
    t.integer "equipment_mounting_flag"
    t.integer "labor_cost_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotation_headers", id: :serial, force: :cascade do |t|
    t.string "quotation_code"
    t.string "invoice_code"
    t.string "delivery_slip_code"
    t.integer "quotation_header_origin_id"
    t.date "quotation_date"
    t.integer "construction_datum_id"
    t.string "construction_name"
    t.integer "customer_id"
    t.string "customer_name"
    t.integer "honorific_id"
    t.string "responsible1"
    t.string "responsible2"
    t.string "post"
    t.string "address"
    t.string "house_number"
    t.string "address2"
    t.string "tel"
    t.string "fax"
    t.string "construction_period"
    t.date "construction_period_date1"
    t.date "construction_period_date2"
    t.string "construction_post"
    t.string "construction_place"
    t.string "construction_house_number"
    t.string "construction_place2"
    t.string "trading_method"
    t.string "effective_period"
    t.integer "quote_price"
    t.integer "execution_amount"
    t.integer "net_amount"
    t.integer "last_line_number"
    t.integer "category_saved_flag"
    t.integer "category_saved_id"
    t.integer "subcategory_saved_id"
    t.date "invoice_period_start_date"
    t.date "invoice_period_end_date"
    t.integer "fixed_flag"
    t.integer "not_sum_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotation_material_details", id: :serial, force: :cascade do |t|
    t.integer "quotation_material_header_id"
    t.integer "material_id"
    t.string "material_code"
    t.string "material_name"
    t.integer "maker_id"
    t.string "maker_name"
    t.integer "quantity"
    t.integer "unit_master_id"
    t.integer "list_price"
    t.integer "quotation_unit_price_1"
    t.integer "quotation_unit_price_2"
    t.integer "quotation_unit_price_3"
    t.integer "quotation_price_1"
    t.integer "quotation_price_2"
    t.integer "quotation_price_3"
    t.integer "bid_flag_1"
    t.integer "bid_flag_2"
    t.integer "bid_flag_3"
    t.integer "mail_sent_flag"
    t.integer "quotation_email_flag_1"
    t.integer "quotation_email_flag_2"
    t.integer "quotation_email_flag_3"
    t.integer "order_email_flag_1"
    t.integer "order_email_flag_2"
    t.integer "order_email_flag_3"
    t.integer "sequential_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotation_material_headers", id: :serial, force: :cascade do |t|
    t.string "quotation_code"
    t.date "requested_date"
    t.integer "construction_datum_id"
    t.integer "supplier_master_id"
    t.string "responsible"
    t.string "email"
    t.integer "delivery_place_flag"
    t.string "notes_1"
    t.string "notes_2"
    t.string "notes_3"
    t.integer "quotation_header_origin_id"
    t.integer "total_quotation_price_1"
    t.integer "total_quotation_price_2"
    t.integer "total_quotation_price_3"
    t.integer "total_order_price_1"
    t.integer "total_order_price_2"
    t.integer "total_order_price_3"
    t.integer "supplier_id_1"
    t.integer "supplier_id_2"
    t.integer "supplier_id_3"
    t.integer "supplier_responsible_id_1"
    t.integer "supplier_responsible_id_2"
    t.integer "supplier_responsible_id_3"
    t.integer "quotation_email_flag_1"
    t.integer "quotation_email_flag_2"
    t.integer "quotation_email_flag_3"
    t.integer "order_email_flag_1"
    t.integer "order_email_flag_2"
    t.integer "order_email_flag_3"
    t.integer "all_bid_flag_1"
    t.integer "all_bid_flag_2"
    t.integer "all_bid_flag_3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sites", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "post"
    t.string "address"
    t.string "house_number"
    t.string "address2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staffs", id: :serial, force: :cascade do |t|
    t.string "staff_name"
    t.string "furigana"
    t.integer "affiliation_id"
    t.integer "hourly_wage"
    t.integer "daily_pay"
    t.integer "supplier_master_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stocktakes", id: :serial, force: :cascade do |t|
    t.date "stocktake_date"
    t.integer "material_master_id"
    t.integer "inventory_id"
    t.decimal "physical_quantity", precision: 11, scale: 2
    t.decimal "unit_price", precision: 11, scale: 2
    t.integer "physical_amount"
    t.decimal "book_quantity", precision: 11, scale: 2
    t.integer "book_amount"
    t.integer "inventory_update_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "supplier_masters", id: :serial, force: :cascade do |t|
    t.string "supplier_name"
    t.string "tel_main"
    t.string "fax_main"
    t.string "email_main"
    t.string "responsible1"
    t.string "email1"
    t.string "responsible2"
    t.string "email2"
    t.string "responsible3"
    t.string "email3"
    t.string "responsible_cc"
    t.string "email_cc"
    t.string "search_character"
    t.integer "outsourcing_flag"
    t.string "post"
    t.string "address"
    t.string "bank_name"
    t.string "bank_branch_name"
    t.integer "account_type"
    t.string "account_number"
    t.string "holder"
    t.string "responsible_title"
    t.string "responsible_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "supplier_responsibles", id: :serial, force: :cascade do |t|
    t.integer "supplier_master_id"
    t.string "responsible_name"
    t.string "responsible_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unit_masters", id: :serial, force: :cascade do |t|
    t.string "unit_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "working_categories", id: :serial, force: :cascade do |t|
    t.string "category_name"
    t.integer "seq"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "working_middle_items", force: :cascade do |t|
    t.string "working_middle_item_name"
    t.string "working_middle_item_short_name"
    t.integer "working_middle_item_category_id"
    t.integer "working_subcategory_id"
    t.string "working_middle_specification"
    t.integer "working_unit_id"
    t.string "working_unit_name"
    t.float "working_unit_price"
    t.integer "execution_unit_price"
    t.integer "material_id"
    t.string "working_material_name"
    t.float "execution_material_unit_price"
    t.float "material_unit_price"
    t.float "execution_labor_unit_price"
    t.float "labor_unit_price"
    t.integer "labor_unit_price_standard"
    t.float "labor_productivity_unit"
    t.float "labor_productivity_unit_total"
    t.integer "material_quantity"
    t.integer "accessory_cost"
    t.integer "material_cost_total"
    t.integer "labor_cost_total"
    t.integer "other_cost"
    t.integer "seq"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "working_safety_matters", id: :serial, force: :cascade do |t|
    t.string "working_safety_matter_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "working_small_items", id: :serial, force: :cascade do |t|
    t.integer "working_middle_item_id"
    t.integer "working_small_item_id"
    t.string "working_small_item_code"
    t.string "working_small_item_name"
    t.float "rate"
    t.float "unit_price"
    t.integer "quantity"
    t.float "material_price"
    t.integer "maker_master_id"
    t.integer "unit_master_id"
    t.float "labor_productivity_unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "working_specific_middle_items", force: :cascade do |t|
    t.integer "quotation_header_id"
    t.integer "delivery_slip_header_id"
    t.string "working_middle_item_name"
    t.string "working_middle_item_short_name"
    t.integer "working_middle_item_category_id"
    t.integer "working_subcategory_id"
    t.string "working_middle_specification"
    t.integer "working_unit_id"
    t.string "working_unit_name"
    t.float "working_unit_price"
    t.integer "execution_unit_price"
    t.integer "material_id"
    t.string "working_material_name"
    t.float "execution_material_unit_price"
    t.float "material_unit_price"
    t.float "execution_labor_unit_price"
    t.float "labor_unit_price"
    t.integer "labor_unit_price_standard"
    t.float "labor_productivity_unit"
    t.float "labor_productivity_unit_total"
    t.integer "material_cost_total"
    t.integer "seq"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "working_specific_small_items", id: :serial, force: :cascade do |t|
    t.integer "working_specific_middle_item_id"
    t.integer "working_small_item_id"
    t.string "working_small_item_code"
    t.string "working_small_item_name"
    t.float "unit_price"
    t.float "rate"
    t.integer "quantity"
    t.float "material_price"
    t.integer "maker_master_id"
    t.integer "unit_master_id"
    t.float "labor_productivity_unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "working_subcategories", id: :serial, force: :cascade do |t|
    t.integer "working_category_id"
    t.string "name"
    t.integer "seq"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "working_times", id: :serial, force: :cascade do |t|
    t.integer "employment_status_id"
    t.time "working_time_start_time"
    t.time "working_time_end_time"
    t.time "overtime_start_time"
    t.time "overtime_end_time"
    t.time "overtime_early_start_time"
    t.time "overtime_early_end_time"
    t.time "overtime_midnight_start_time"
    t.time "overtime_midnight_end_time"
    t.time "break_time_1_start_time"
    t.time "break_time_1_end_time"
    t.time "break_time_2_start_time"
    t.time "break_time_2_end_time"
    t.time "break_time_3_start_time"
    t.time "break_time_3_end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "working_units", id: :serial, force: :cascade do |t|
    t.string "working_unit_name"
    t.integer "seq"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
