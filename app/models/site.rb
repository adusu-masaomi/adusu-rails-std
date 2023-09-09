class Site < ApplicationRecord

  #demo版対応
  MAX_RECORD_COUNT = 10
  
  paginates_per 200  # 1ページあたり項目表示
  
  #demo版対応
  #validate :site_count_must_be_within_limit, on: :create

  #demo版対応
  def site_count_must_be_within_limit
    errors.add(:base, "デモ版は#{MAX_RECORD_COUNT}件しか登録できません") if Site.count >= MAX_RECORD_COUNT
  end

  def self.ransackable_attributes(auth_object = nil)
    ["address", "address2", "created_at", "house_number", "id", "name", "post", "updated_at"]
  end
end
