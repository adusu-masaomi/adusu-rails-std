class Contact < ApplicationRecord
  
  paginates_per 200  # 1ページあたり項目表示
  #demo版対応
  MAX_RECORD_COUNT = 6

  #demo版対応
  #validate :contact_count_must_be_within_limit, on: :create
 
  #demo版対応
  def contact_count_must_be_within_limit
    errors.add(:base, "デモ版は#{MAX_RECORD_COUNT}件しか登録できません") if Contact.count >= MAX_RECORD_COUNT
  end

  def self.partner_division 
    [["未選択", 0], ["得意先", 1], ["仕入先", 2]] 
  end
  def self.ransackable_attributes(auth_object = nil)
    ["address", "affiliation", "company_name", "created_at", "department", "email", "fax", "id", "name", "partner_division_id", "post", "search_character", "tel", "updated_at", "url"]
  end
  def self.ransackable_associations(auth_object = nil)
    []
  end
end
