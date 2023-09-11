class IdSetContacts < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('contacts_id_seq', 196)"
  end
end
