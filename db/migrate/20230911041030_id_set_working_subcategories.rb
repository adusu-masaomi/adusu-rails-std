class IdSetWorkingSubcategories < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('working_subcategories_id_seq', 21)"
  end
end
