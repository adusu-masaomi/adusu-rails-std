class AddLastListPriceUpdateAtToWorkingSmallItems < ActiveRecord::Migration[6.1]
  def change
    add_column :working_small_items, :last_list_price_update_at, :date
  end
end
