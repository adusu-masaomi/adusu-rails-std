class PurchaseDivision < ApplicationRecord
  has_many :PurchaseDatum

  #demo版対応
  MAX_RECORD_COUNT = 5
  
  #demo版対応
  validate :purchase_division_count_must_be_within_limit, on: :create
  
  before_destroy :ensure_id
  
  #demo版対応
  def purchase_division_count_must_be_within_limit
    errors.add(:base, "デモ版は#{MAX_RECORD_COUNT}件しか登録できません") if PurchaseDivision.count >= MAX_RECORD_COUNT
  end
  
  def ensure_id
    return true if id == 1
    errors.add(:base, "Cannot delete booking with payments")
    return false
    # Rails 5
    #throw :abort
  end
  
end
