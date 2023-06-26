class CreateWorkingUnits < ActiveRecord::Migration
  def change
    create_table :working_units do |t|
      t.string :working_unit_name
      t.integer :seq

      t.timestamps null: false
    end
  end
end
