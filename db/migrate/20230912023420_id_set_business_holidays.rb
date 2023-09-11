class IdSetBusinessHolidays < ActiveRecord::Migration[6.1]
  def change
      execute "SELECT setval('business_holidays_id_seq', 259)"
  end
end
