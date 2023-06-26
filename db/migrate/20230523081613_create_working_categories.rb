class CreateWorkingCategories < ActiveRecord::Migration
  def change
    create_table :working_categories do |t|
      t.string :category_name
      t.integer :seq

      t.timestamps null: false
    end
  end
end
