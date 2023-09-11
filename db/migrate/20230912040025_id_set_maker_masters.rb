class IdSetMakerMasters < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('maker_masters_id_seq', 146)"
  end
end
