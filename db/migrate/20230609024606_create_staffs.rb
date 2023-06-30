class CreateStaffs < ActiveRecord::Migration[6.1]
  def change
    create_table :staffs do |t|
      t.string :staff_name
      t.string :furigana
      t.integer :affiliation_id
      t.integer :hourly_wage
      t.integer :daily_pay
      t.integer :is_outsourcing
      t.integer :supplier_master_id

      t.timestamps null: false
    end
  end
end
