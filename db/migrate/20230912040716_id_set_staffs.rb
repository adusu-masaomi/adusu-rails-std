class IdSetStaffs < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('staffs_id_seq', 8)"
  end
end
