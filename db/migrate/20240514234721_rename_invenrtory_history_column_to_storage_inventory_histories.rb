class RenameInvenrtoryHistoryColumnToStorageInventoryHistories < ActiveRecord::Migration[6.1]
  def change
    rename_column :storage_inventory_histories, :invenrtory_division_id, :inventory_division_id
  end
end
