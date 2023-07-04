class MaterialCategory < ApplicationRecord
  #demo版対応
  MAX_RECORD_COUNT = 6

  #demo版対応
  validate :material_category_count_must_be_within_limit, on: :create

  #demo版対応
  def material_category_count_must_be_within_limit
    errors.add(:base, "デモ版は#{MAX_RECORD_COUNT}件しか登録できません") if MaterialCategory.count >= MAX_RECORD_COUNT
  end

end
