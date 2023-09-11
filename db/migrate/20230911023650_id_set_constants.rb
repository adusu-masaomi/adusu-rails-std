class IdSetConstants < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('constants_id_seq', 2)"
  end
end
