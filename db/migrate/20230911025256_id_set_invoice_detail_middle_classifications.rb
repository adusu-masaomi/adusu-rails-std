class IdSetInvoiceDetailMiddleClassifications < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('invoice_detail_middle_classifications_id_seq', 166)"
  end
end
