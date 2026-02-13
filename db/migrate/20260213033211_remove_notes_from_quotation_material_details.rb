class RemoveNotesFromQuotationMaterialDetails < ActiveRecord::Migration[6.1]
  def change
    remove_column :quotation_material_details, :notes, :string
  end
end
