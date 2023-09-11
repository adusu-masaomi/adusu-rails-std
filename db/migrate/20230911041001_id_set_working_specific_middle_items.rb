class IdSetWorkingSpecificMiddleItems < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('working_specific_middle_items_id_seq', 35)"
  end
end
