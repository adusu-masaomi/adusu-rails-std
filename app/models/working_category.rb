class WorkingCategory < ApplicationRecord

  #demo版対応
  MAX_RECORD_COUNT = 5

  #demo版対応
  validate :working_category_matter_must_be_within_limit, on: :create

  #demo版対応
  def working_category_matter_must_be_within_limit
    errors.add(:base, "デモ版は#{MAX_RECORD_COUNT}件しか登録できません") if WorkingCategory.count >= MAX_RECORD_COUNT
  end

  def self.ransackable_attributes(auth_object = nil)
    ["category_name", "created_at", "id", "seq", "updated_at"]
  end
end
