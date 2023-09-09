class WorkingSubcategory < ApplicationRecord
  #belongs_to :working_category
  #seed用
  belongs_to :working_category, optional: true

  #demo版対応
  MAX_RECORD_COUNT = 10


  #demo版対応
  #validate :working_subcategory_count_must_be_within_limit, on: :create

  #demo版対応
  def working_subcategory_count_must_be_within_limit
    errors.add(:base, "デモ版は#{MAX_RECORD_COUNT}件しか登録できません") if WorkingSubcategory.count >= MAX_RECORD_COUNT
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "seq", "updated_at", "working_category_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["working_category"]
  end
end
