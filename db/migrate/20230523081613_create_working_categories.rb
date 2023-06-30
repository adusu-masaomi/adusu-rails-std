class CreateWorkingCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :working_categories do |t|
      t.string :category_name
      t.integer :seq

      t.timestamps null: false
    end
  end
end
