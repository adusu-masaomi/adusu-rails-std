class PurchaseDivision < ApplicationRecord
  #demo版対応
  MAX_RECORD_COUNT = 10
  
  before_destroy :ensure_id
  
  has_many :PurchaseDatum
  
  #demo版対応
  #validate :purchase_division_count_must_be_within_limit, on: :create
  
    
  #demo版対応
  def purchase_division_count_must_be_within_limit
    errors.add(:base, "デモ版は#{MAX_RECORD_COUNT}件しか登録できません") if PurchaseDivision.count >= MAX_RECORD_COUNT
  end
  
  def ensure_id
    return true if "#{id}".to_i > 4  #idが4までは削除できないように
    errors.add(:base, "Cannot delete booking with payments")
    throw :abort  #Rails6
    return false
    # Rails 5
    #throw :abort
  end
  def self.ransackable_attributes(auth_object = nil)
   ["created_at", "id", "purchase_division_long_name", "purchase_division_name", "updated_at"]
  end
end
