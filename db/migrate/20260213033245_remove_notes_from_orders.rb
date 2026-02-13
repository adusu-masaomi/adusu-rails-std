class RemoveNotesFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :notes, :string
  end
end
