class IdSetInvoiceDetailLargeClassifications < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('invoice_detail_large_classifications_id_seq', 2329)"
  end
end
