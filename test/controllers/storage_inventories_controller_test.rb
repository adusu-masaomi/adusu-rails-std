require "test_helper"

class StorageInventoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @storage_inventory = storage_inventories(:one)
  end

  test "should get index" do
    get storage_inventories_url
    assert_response :success
  end

  test "should get new" do
    get new_storage_inventory_url
    assert_response :success
  end

  test "should create storage_inventory" do
    assert_difference('StorageInventory.count') do
      post storage_inventories_url, params: { storage_inventory: { location_id: @storage_inventory.location_id, material_master_id: @storage_inventory.material_master_id, quantity: @storage_inventory.quantity, unit_master_id: @storage_inventory.unit_master_id, unit_price: @storage_inventory.unit_price, warehouse_id: @storage_inventory.warehouse_id } }
    end

    assert_redirected_to storage_inventory_url(StorageInventory.last)
  end

  test "should show storage_inventory" do
    get storage_inventory_url(@storage_inventory)
    assert_response :success
  end

  test "should get edit" do
    get edit_storage_inventory_url(@storage_inventory)
    assert_response :success
  end

  test "should update storage_inventory" do
    patch storage_inventory_url(@storage_inventory), params: { storage_inventory: { location_id: @storage_inventory.location_id, material_master_id: @storage_inventory.material_master_id, quantity: @storage_inventory.quantity, unit_master_id: @storage_inventory.unit_master_id, unit_price: @storage_inventory.unit_price, warehouse_id: @storage_inventory.warehouse_id } }
    assert_redirected_to storage_inventory_url(@storage_inventory)
  end

  test "should destroy storage_inventory" do
    assert_difference('StorageInventory.count', -1) do
      delete storage_inventory_url(@storage_inventory)
    end

    assert_redirected_to storage_inventories_url
  end
end
