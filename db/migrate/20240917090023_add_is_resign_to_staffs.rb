class AddIsResignToStaffs < ActiveRecord::Migration[6.1]
  def change
    add_column :staffs, :is_resign, :integer
  end
end
