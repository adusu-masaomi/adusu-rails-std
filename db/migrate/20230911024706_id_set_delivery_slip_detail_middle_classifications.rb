class IdSetDeliverySlipDetailMiddleClassifications < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('delivery_slip_detail_middle_classifications_id_seq', 4523)"
  end
end
