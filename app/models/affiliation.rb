class Affiliation < ApplicationRecord

  #demo版対応
  MAX_RECORD_COUNT = 5

  #demo版対応
  validate :affiliation_count_must_be_within_limit, on: :create

  #demo版対応
  def affiliation_count_must_be_within_limit
    errors.add(:base, "デモ版は#{MAX_RECORD_COUNT}件しか登録できません") if Affiliation.count >= MAX_RECORD_COUNT
  end

end
