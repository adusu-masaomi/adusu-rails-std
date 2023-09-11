class IdSetQuotationMaterialDetails < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('quotation_material_details_id_seq', 6931)"
  end
end
