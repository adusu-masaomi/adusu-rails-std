class Staff < ApplicationRecord
  belongs_to :affiliation, optional: true
  has_many :construction_daily_reports

  #demo版対応
  MAX_RECORD_COUNT = 6

  #demo版対応
  validate :staff_count_must_be_within_limit, on: :create

  #demo版対応
  def staff_count_must_be_within_limit
    errors.add(:base, "デモ版は#{MAX_RECORD_COUNT}件しか登録できません") if Staff.count >= MAX_RECORD_COUNT
  end

end
