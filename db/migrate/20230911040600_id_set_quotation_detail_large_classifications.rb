class IdSetQuotationDetailLargeClassifications < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('quotation_detail_large_classifications_id_seq', 3912)"
  end
end
