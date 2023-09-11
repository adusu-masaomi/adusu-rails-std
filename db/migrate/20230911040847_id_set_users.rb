class IdSetUsers < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('users_id_seq', 6)"
  end
end
