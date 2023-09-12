class MakerMaster < ApplicationRecord
  paginates_per 100  # 1ページあたり項目表示(index.html)
  #demo版対応
  MAX_RECORD_COUNT = 11
  
  before_destroy :ensure_id

	has_many :PurchaseDatum
	validates :maker_name, uniqueness: true
  #demo版対応
  #validate :maker_master_count_must_be_within_limit, on: :create

  #特定のIDは削除できないようにする
  def ensure_id
    return true if "#{id}".to_i > 1  #id1は削除できないように
    errors.add(:base, "Cannot delete booking with payments")
    throw :abort  #Rails6
    return false
  end
  
  #demo版対応
  def maker_master_count_must_be_within_limit
    errors.add(:base, "デモ版は#{MAX_RECORD_COUNT}件しか登録できません") if MakerMaster.count >= MAX_RECORD_COUNT
  end
  #ruby3対応
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "maker_name", "updated_at"]
  end
end
