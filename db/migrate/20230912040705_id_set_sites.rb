class IdSetSites < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('sites_id_seq', 5686)"
  end
end
