class WorkingTime < ApplicationRecord
  MAX_RECORD_COUNT = 1
  validate :count_must_be_within_limit, on: :create
  before_destroy :ensure_count
  
  def count_must_be_within_limit
    errors.add(:working_time_start_time, "勤務時間マスターは#{MAX_RECORD_COUNT}件しか登録できません") if WorkingTime.count >= MAX_RECORD_COUNT
  end
  
  def ensure_count
    return true if WorkingTime.count > 1
    #エラーメッセージはコントローラ側で作成
    errors.add(:base, "Cannot delete booking with payments")
    return false
  end
  
end
