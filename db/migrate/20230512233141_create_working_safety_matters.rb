class CreateWorkingSafetyMatters < ActiveRecord::Migration[6.1]
  def change
    create_table :working_safety_matters do |t|
      t.string :working_safety_matter_name

      t.timestamps null: false
    end
  end
end
