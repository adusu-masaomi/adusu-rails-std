require "test_helper"

class StorageInventoryHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @storage_inventory_history = storage_inventory_histories(:one)
  end

  test "should get index" do
    get storage_inventory_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_storage_inventory_history_url
    assert_response :success
  end

  test "should create storage_inventory_history" do
    assert_difference('StorageInventoryHistory.count') do
      post storage_inventory_histories_url, params: { storage_inventory_history: { amount: @storage_inventory_history.amount, construction_datum_id: @storage_inventory_history.construction_datum_id, invenrtory_division_id: @storage_inventory_history.invenrtory_division_id, material_master_id: @storage_inventory_history.material_master_id, occurred_date: @storage_inventory_history.occurred_date, purchase_order_datum_id: @storage_inventory_history.purchase_order_datum_id, quantity: @storage_inventory_history.quantity, slip_code: @storage_inventory_history.slip_code, supplier_master_id: @storage_inventory_history.supplier_master_id, unit_price: @storage_inventory_history.unit_price } }
    end

    assert_redirected_to storage_inventory_history_url(StorageInventoryHistory.last)
  end

  test "should show storage_inventory_history" do
    get storage_inventory_history_url(@storage_inventory_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_storage_inventory_history_url(@storage_inventory_history)
    assert_response :success
  end

  test "should update storage_inventory_history" do
    patch storage_inventory_history_url(@storage_inventory_history), params: { storage_inventory_history: { amount: @storage_inventory_history.amount, construction_datum_id: @storage_inventory_history.construction_datum_id, invenrtory_division_id: @storage_inventory_history.invenrtory_division_id, material_master_id: @storage_inventory_history.material_master_id, occurred_date: @storage_inventory_history.occurred_date, purchase_order_datum_id: @storage_inventory_history.purchase_order_datum_id, quantity: @storage_inventory_history.quantity, slip_code: @storage_inventory_history.slip_code, supplier_master_id: @storage_inventory_history.supplier_master_id, unit_price: @storage_inventory_history.unit_price } }
    assert_redirected_to storage_inventory_history_url(@storage_inventory_history)
  end

  test "should destroy storage_inventory_history" do
    assert_difference('StorageInventoryHistory.count', -1) do
      delete storage_inventory_history_url(@storage_inventory_history)
    end

    assert_redirected_to storage_inventory_histories_url
  end
end
