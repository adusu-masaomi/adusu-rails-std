class CreateUnitMasters < ActiveRecord::Migration[6.1]
  def change
    create_table :unit_masters do |t|
      t.string :unit_name

      t.timestamps null: false
    end
  end
end
