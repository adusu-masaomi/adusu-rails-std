class ChangeDataPaymentDateToInvoiceHeader < ActiveRecord::Migration[6.1]
  def change
    change_column :invoice_headers, :payment_date, :date
  end
end
