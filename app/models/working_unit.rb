class WorkingUnit < ApplicationRecord
  before_destroy :ensure_id
  
  #demo版対応
  MAX_RECORD_COUNT = 10

  validates :working_unit_name, presence: true
  
  #demo版対応
  validate :working_unit_count_must_be_within_limit, on: :create

  #demo版対応
  def working_unit_count_must_be_within_limit
    errors.add(:base, "デモ版は#{MAX_RECORD_COUNT}件しか登録できません") if WorkingUnit.count >= MAX_RECORD_COUNT
  end
  
  #特定のIDは削除できないようにする
  def ensure_id
    return true if "#{id}".to_i > 1  #id1は削除できないように
    errors.add(:base, "Cannot delete booking with payments")
    throw :abort  #Rails6
    return false
  end
  
  #工事種別をここで宣言
  #単位と直接関連がないが、共通化したい為
  def self.types 
    #[["通常", 0], ["小計", 1], ["値引", 2], ["配管配線工事", 3], ["機器取付工事", 4], ["労務費", 5]]
    #標準版仕様--
    [["通常", 0], ["小計", 1]]
  end
  
end
