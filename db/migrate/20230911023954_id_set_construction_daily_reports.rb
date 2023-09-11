class IdSetConstructionDailyReports < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('construction_daily_reports_id_seq', 9666)"
  end
end
