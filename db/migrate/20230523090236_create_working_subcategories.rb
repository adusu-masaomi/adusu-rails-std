class CreateWorkingSubcategories < ActiveRecord::Migration[6.1]
  def change
    create_table :working_subcategories do |t|
      t.integer :working_category_id
      t.string :name
      t.integer :seq

      t.timestamps null: false
    end
  end
end
