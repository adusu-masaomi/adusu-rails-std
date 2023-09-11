class IdSetWorkingSmallItems < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('working_small_items_id_seq', 1142)"
  end
end
