class DropDeliverySlipDetailLargeClassification < ActiveRecord::Migration[6.1]
  def change
    drop_table :delivery_slip_detail_large_classifications
  end
end
