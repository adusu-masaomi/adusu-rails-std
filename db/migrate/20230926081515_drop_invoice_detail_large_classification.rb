class DropInvoiceDetailLargeClassification < ActiveRecord::Migration[6.1]
  def change
    drop_table :invoice_detail_large_classifications
  end
end
