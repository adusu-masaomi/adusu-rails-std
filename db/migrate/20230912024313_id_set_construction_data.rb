class IdSetConstructionData < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('construction_data_id_seq', 2691)"
  end
end
