class CreateWorkingSafetyMatters < ActiveRecord::Migration
  def change
    create_table :working_safety_matters do |t|
      t.string :working_safety_matter_name

      t.timestamps null: false
    end
  end
end
