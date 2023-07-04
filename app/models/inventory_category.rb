class InventoryCategory < ApplicationRecord

  #demo版対応
  MAX_RECORD_COUNT = 6

  #demo版対応
  validate :inventory_category_count_must_be_within_limit, on: :create

  #demo版対応
  def inventory_category_count_must_be_within_limit
    errors.add(:base, "デモ版は#{MAX_RECORD_COUNT}件しか登録できません") if InventoryCategory.count >= MAX_RECORD_COUNT
  end

end
