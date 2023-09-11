class DropWorkingSmallItem < ActiveRecord::Migration[6.1]
  def change
    drop_table :working_small_items
  end
end
