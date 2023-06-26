class CreateConstructionAttachments < ActiveRecord::Migration
  def change
    create_table :construction_attachments do |t|
      t.integer :construction_datum_id
      t.string :title
      t.string :attachment

      t.timestamps null: false
    end
  end
end
