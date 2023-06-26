class CreateMakerMasters < ActiveRecord::Migration
  def change
    create_table :maker_masters do |t|
      t.string :maker_name

      t.timestamps null: false
    end
  end
end
