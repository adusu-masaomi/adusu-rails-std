class IdSetAffiliations < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('affiliations_id_seq', 4)"
  end
end
