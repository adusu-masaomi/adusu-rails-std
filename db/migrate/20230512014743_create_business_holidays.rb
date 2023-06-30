class CreateBusinessHolidays < ActiveRecord::Migration[6.1]
  def change
    create_table :business_holidays do |t|
      t.date :working_date
      t.integer :holiday_flag

      t.timestamps null: false
    end
  end
end
