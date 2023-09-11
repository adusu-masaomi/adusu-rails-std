class IdSetConstructionCosts < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('construction_costs_id_seq', 1852)"
  end
end
