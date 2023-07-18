class PurchaseHeader < ApplicationRecord
  paginates_per 200  # 1ページあたり項目表示
  
  #demo版対応
  MAX_RECORD_COUNT = 10
  
  #demo版対応
  validate :purchase_header_count_must_be_within_limit, on: :create
  
  #demo版対応
  def purchase_header_count_must_be_within_limit
    errors.add(:base, "デモ版は#{MAX_RECORD_COUNT}件しか登録できません") if PurchaseHeader.count >= MAX_RECORD_COUNT
  end
  
  
  #ruby3
  def self.ransackable_attributes(auth_object = nil)
    ["complete_flag", "created_at", "id", "slip_code", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    []
  end
end
