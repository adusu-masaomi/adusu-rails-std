class IdSetOutsourcingCosts < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('outsourcing_costs_id_seq', 1051)"
  end
end
