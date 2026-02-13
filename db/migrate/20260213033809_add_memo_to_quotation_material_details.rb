class AddMemoToQuotationMaterialDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :quotation_material_details, :memo, :string
  end
end
