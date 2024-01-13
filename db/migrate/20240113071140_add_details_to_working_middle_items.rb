class AddDetailsToWorkingMiddleItems < ActiveRecord::Migration[6.1]
  def change
    add_column :working_middle_items, :accessory_base_cost, :integer
    add_column :working_middle_items, :accessory_rate, :float
    add_column :working_middle_items, :miscellaneous_base_cost, :float
    add_column :working_middle_items, :miscellaneous_rate, :float
    add_column :working_middle_items, :miscellaneous_cost, :float
    add_column :working_middle_items, :other_base_cost, :float
    add_column :working_middle_items, :other_rate, :float
  end
end
