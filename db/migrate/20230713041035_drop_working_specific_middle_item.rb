class DropWorkingSpecificMiddleItem < ActiveRecord::Migration[6.1]
  def change
    drop_table :working_specific_middle_items
  end
end
