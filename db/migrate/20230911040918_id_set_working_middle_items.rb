class IdSetWorkingMiddleItems < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('working_middle_items_id_seq', 989)"
  end
end
