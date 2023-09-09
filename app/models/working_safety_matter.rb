class WorkingSafetyMatter < ApplicationRecord

  #demo版対応
  MAX_RECORD_COUNT = 10

  #demo版対応
  #validate :working_safety_matter_count_must_be_within_limit, on: :create

  #demo版対応
  def working_safety_matter_count_must_be_within_limit
    errors.add(:base, "デモ版は#{MAX_RECORD_COUNT}件しか登録できません") if WorkingSafetyMatter.count >= MAX_RECORD_COUNT
  end

end
