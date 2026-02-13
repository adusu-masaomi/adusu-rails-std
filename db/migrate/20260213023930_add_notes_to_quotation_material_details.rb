class AddNotesToQuotationMaterialDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :quotation_material_details, :notes, :string
  end
end
