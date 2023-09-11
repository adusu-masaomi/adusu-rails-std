class IdSetQuotationDetailMiddleClassifications < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('quotation_detail_middle_classifications_id_seq', 18968)"
  end
end
