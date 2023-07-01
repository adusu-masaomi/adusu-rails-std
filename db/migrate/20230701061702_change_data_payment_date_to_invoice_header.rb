class ChangeDataPaymentDateToInvoiceHeader < ActiveRecord::Migration[6.1]
  def change
    drop_table :invoice_headers
  end
end
