class IdSetWorkingUnits < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('working_units_id_seq', 43)"
  end
end
