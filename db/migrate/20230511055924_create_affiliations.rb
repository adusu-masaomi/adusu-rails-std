class CreateAffiliations < ActiveRecord::Migration[6.1]
  def change
    create_table :affiliations do |t|
      t.string :affiliation_name

      t.timestamps null: false
    end
  end
end
