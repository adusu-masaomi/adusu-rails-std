class IdSetInvoiceHeaders < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('invoice_headers_id_seq', 709)"
  end
end
