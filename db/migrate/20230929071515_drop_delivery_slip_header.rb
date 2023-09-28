class DropDeliverySlipHeader < ActiveRecord::Migration[6.1]
  def change
    drop_table :delivery_slip_headers
  end
end
