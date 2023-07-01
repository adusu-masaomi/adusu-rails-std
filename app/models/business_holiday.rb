class BusinessHoliday < ApplicationRecord
  paginates_per 200  # 1ページあたり項目表示
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "holiday_flag", "id", "updated_at", "working_date"]
  end
  def self.ransackable_associations(auth_object = nil)
    [] 
  end
end
