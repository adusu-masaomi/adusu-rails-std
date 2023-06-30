class CreateMakerMasters < ActiveRecord::Migration[6.1]
  def change
    create_table :maker_masters do |t|
      t.string :maker_name

      t.timestamps null: false
    end
  end
end
