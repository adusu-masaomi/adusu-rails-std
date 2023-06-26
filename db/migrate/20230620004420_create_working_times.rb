class CreateWorkingTimes < ActiveRecord::Migration
  def change
    create_table :working_times do |t|
      t.integer :employment_status_id
      t.time :working_time_start_time
      t.time :working_time_end_time
      t.time :overtime_start_time
      t.time :overtime_end_time
      t.time :overtime_early_start_time
      t.time :overtime_early_end_time
      t.time :overtime_midnight_start_time
      t.time :overtime_midnight_end_time
      t.time :break_time_1_start_time
      t.time :break_time_1_end_time
      t.time :break_time_2_start_time
      t.time :break_time_2_end_time
      t.time :break_time_3_start_time
      t.time :break_time_3_end_time

      t.timestamps null: false
    end
  end
end
