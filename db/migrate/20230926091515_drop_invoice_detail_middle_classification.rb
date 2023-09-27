class DropInvoiceDetailMiddleClassification < ActiveRecord::Migration[6.1]
  def change
    drop_table :invoice_detail_middle_classifications
  end
end
