class IdSetQuotationHeaders < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('quotation_headers_id_seq', 967)"
  end
end
