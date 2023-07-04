class PurchaseDivision < ApplicationRecord
  has_many :PurchaseDatum

  #demo版対応
  MAX_RECORD_COUNT = 6

  #demo版対応
  validate :purchase_division_count_must_be_within_limit, on: :create

  #demo版対応
  def purchase_division_count_must_be_within_limit
    errors.add(:base, "デモ版は#{MAX_RECORD_COUNT}件しか登録できません") if PurchaseDivision.count >= MAX_RECORD_COUNT
  end

end
