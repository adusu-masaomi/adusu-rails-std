class IdSetDeliverySlipHeaders < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('delivery_slip_headers_id_seq', 1510)"
  end
end
