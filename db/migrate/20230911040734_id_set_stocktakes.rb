class IdSetStocktakes < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('stocktakes_id_seq', 5505)"
  end
end
