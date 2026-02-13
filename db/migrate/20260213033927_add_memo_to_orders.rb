class AddMemoToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :memo, :string
  end
end
