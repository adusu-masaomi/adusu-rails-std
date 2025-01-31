class AddIsInvisibleToStaffs < ActiveRecord::Migration[6.1]
  def change
    add_column :staffs, :is_invisible, :integer
  end
end
