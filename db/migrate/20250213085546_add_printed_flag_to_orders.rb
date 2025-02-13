class AddPrintedFlagToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :printed_flag, :integer
  end
end
