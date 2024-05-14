require "application_system_test_case"

class StorageInventoryHistoriesTest < ApplicationSystemTestCase
  setup do
    @storage_inventory_history = storage_inventory_histories(:one)
  end

  test "visiting the index" do
    visit storage_inventory_histories_url
    assert_selector "h1", text: "Storage Inventory Histories"
  end

  test "creating a Storage inventory history" do
    visit storage_inventory_histories_url
    click_on "New Storage Inventory History"

    fill_in "Amount", with: @storage_inventory_history.amount
    fill_in "Construction datum", with: @storage_inventory_history.construction_datum_id
    fill_in "Invenrtory division", with: @storage_inventory_history.invenrtory_division_id
    fill_in "Material master", with: @storage_inventory_history.material_master_id
    fill_in "Occurred date", with: @storage_inventory_history.occurred_date
    fill_in "Purchase order datum", with: @storage_inventory_history.purchase_order_datum_id
    fill_in "Quantity", with: @storage_inventory_history.quantity
    fill_in "Slip code", with: @storage_inventory_history.slip_code
    fill_in "Supplier master", with: @storage_inventory_history.supplier_master_id
    fill_in "Unit price", with: @storage_inventory_history.unit_price
    click_on "Create Storage inventory history"

    assert_text "Storage inventory history was successfully created"
    click_on "Back"
  end

  test "updating a Storage inventory history" do
    visit storage_inventory_histories_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @storage_inventory_history.amount
    fill_in "Construction datum", with: @storage_inventory_history.construction_datum_id
    fill_in "Invenrtory division", with: @storage_inventory_history.invenrtory_division_id
    fill_in "Material master", with: @storage_inventory_history.material_master_id
    fill_in "Occurred date", with: @storage_inventory_history.occurred_date
    fill_in "Purchase order datum", with: @storage_inventory_history.purchase_order_datum_id
    fill_in "Quantity", with: @storage_inventory_history.quantity
    fill_in "Slip code", with: @storage_inventory_history.slip_code
    fill_in "Supplier master", with: @storage_inventory_history.supplier_master_id
    fill_in "Unit price", with: @storage_inventory_history.unit_price
    click_on "Update Storage inventory history"

    assert_text "Storage inventory history was successfully updated"
    click_on "Back"
  end

  test "destroying a Storage inventory history" do
    visit storage_inventory_histories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Storage inventory history was successfully destroyed"
  end
end
