class IdSetUnitMasters < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('unit_masters_id_seq', 27)"
  end
end
