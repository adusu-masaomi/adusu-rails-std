class CreateConstructionDailyReports < ActiveRecord::Migration
  def change
    create_table :construction_daily_reports do |t|
      t.date :working_date
      t.integer :construction_datum_id
      t.integer :staff_id
      t.time :start_time_1
      t.time :end_time_1
      t.time :start_time_2
      t.time :end_time_2
      t.integer :working_times
      t.decimal :man_month
      t.integer :labor_cost
      t.string :working_details
      t.integer :is_one_day_work
      t.integer :is_no_break_time_1
      t.integer :is_no_break_time_2
      t.integer :is_no_break_time_3

      t.timestamps null: false
    end
  end
end
