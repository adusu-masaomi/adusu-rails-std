require "application_system_test_case"

class StorageInventoriesTest < ApplicationSystemTestCase
  setup do
    @storage_inventory = storage_inventories(:one)
  end

  test "visiting the index" do
    visit storage_inventories_url
    assert_selector "h1", text: "Storage Inventories"
  end

  test "creating a Storage inventory" do
    visit storage_inventories_url
    click_on "New Storage Inventory"

    fill_in "Location", with: @storage_inventory.location_id
    fill_in "Material master", with: @storage_inventory.material_master_id
    fill_in "Quantity", with: @storage_inventory.quantity
    fill_in "Unit master", with: @storage_inventory.unit_master_id
    fill_in "Unit price", with: @storage_inventory.unit_price
    fill_in "Warehouse", with: @storage_inventory.warehouse_id
    click_on "Create Storage inventory"

    assert_text "Storage inventory was successfully created"
    click_on "Back"
  end

  test "updating a Storage inventory" do
    visit storage_inventories_url
    click_on "Edit", match: :first

    fill_in "Location", with: @storage_inventory.location_id
    fill_in "Material master", with: @storage_inventory.material_master_id
    fill_in "Quantity", with: @storage_inventory.quantity
    fill_in "Unit master", with: @storage_inventory.unit_master_id
    fill_in "Unit price", with: @storage_inventory.unit_price
    fill_in "Warehouse", with: @storage_inventory.warehouse_id
    click_on "Update Storage inventory"

    assert_text "Storage inventory was successfully updated"
    click_on "Back"
  end

  test "destroying a Storage inventory" do
    visit storage_inventories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Storage inventory was successfully destroyed"
  end
end
