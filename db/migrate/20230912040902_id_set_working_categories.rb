class IdSetWorkingCategories < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('working_categories_id_seq', 49)"
  end
end
