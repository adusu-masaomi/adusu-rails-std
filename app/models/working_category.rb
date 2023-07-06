class WorkingCategory < ApplicationRecord
  before_destroy :ensure_id
  
  #demo版対応
  MAX_RECORD_COUNT = 5

  #demo版対応
  validate :working_category_matter_must_be_within_limit, on: :create

  #demo版対応
  def working_category_matter_must_be_within_limit
    errors.add(:base, "デモ版は#{MAX_RECORD_COUNT}件しか登録できません") if WorkingCategory.count >= MAX_RECORD_COUNT
  end
  
  #特定のIDは削除できないようにする
  def ensure_id
    return true if "#{id}".to_i > 1  #id1は削除できないように
    errors.add(:base, "Cannot delete booking with payments")
    throw :abort  #Rails6
    return false
  end
  
  def self.ransackable_attributes(auth_object = nil)
    ["category_name", "created_at", "id", "seq", "updated_at"]
  end
end
