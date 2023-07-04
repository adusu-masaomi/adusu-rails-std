class MakerMaster < ApplicationRecord
  paginates_per 100  # 1ページあたり項目表示(index.html)
  #demo版対応
  MAX_RECORD_COUNT = 6

	has_many :PurchaseDatum
	validates :maker_name, uniqueness: true
  #demo版対応
  validate :maker_master_count_must_be_within_limit, on: :create


  #demo版対応
  def maker_master_count_must_be_within_limit
    errors.add(:base, "デモ版は#{MAX_RECORD_COUNT}件しか登録できません") if MakerMaster.count >= MAX_RECORD_COUNT
  end
  #ruby3対応
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "maker_name", "updated_at"]
  end
end
