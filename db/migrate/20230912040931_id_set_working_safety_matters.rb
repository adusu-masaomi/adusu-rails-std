class IdSetWorkingSafetyMatters < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('working_safety_matters_id_seq', 14)"
  end
end
