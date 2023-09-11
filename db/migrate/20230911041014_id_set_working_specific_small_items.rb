class IdSetWorkingSpecificSmallItems < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('working_specific_small_items_id_seq', 83)"
  end
end
