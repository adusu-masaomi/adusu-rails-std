json.extract! storage_inventory, :id, :warehouse_id, :location_id, :material_master_id, :quantity, :unit_master_id, :unit_price, :created_at, :updated_at
json.url storage_inventory_url(storage_inventory, format: :json)
