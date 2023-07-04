class WorkingUnit < ApplicationRecord

  #demo版対応
  MAX_RECORD_COUNT = 5

  validates :working_unit_name, presence: true
  
  #demo版対応
  validate :working_unit_matter_must_be_within_limit, on: :create

  #demo版対応
  def working_unit_matter_must_be_within_limit
    errors.add(:base, "デモ版は#{MAX_RECORD_COUNT}件しか登録できません") if WorkingUnit.count >= MAX_RECORD_COUNT
  end

  #工事種別をここで宣言
  #単位と直接関連がないが、共通化したい為
  def self.types 
    #[["通常", 0], ["小計", 1], ["値引", 2], ["配管配線工事", 3], ["機器取付工事", 4], ["労務費", 5]]
    #標準版仕様--
    [["通常", 0], ["小計", 1]]
  end
  
end
