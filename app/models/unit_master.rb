class UnitMaster < ApplicationRecord

  #demo版対応
  MAX_RECORD_COUNT = 6

  #バリデーション
  validates :unit_name, presence: true, uniqueness: true
  
  #demo版対応
  validate :unit_master_price_count_must_be_within_limit, on: :create

  #demo版対応
  def unit_master_price_count_must_be_within_limit
    errors.add(:base, "デモ版は#{MAX_RECORD_COUNT}件しか登録できません") if UnitMaster.count >= MAX_RECORD_COUNT
  end


  #即時に取り出せるよう配列化
  #これだとIDが削除された場合にNG...使わないこと(220518)
  def self.all_list
    UnitMaster.all.pluck("unit_name, id")
  end
   
  #単位を返す(IDと連動させる)
  def self.all_list_by_id(unit_master_id)
    unit_master = UnitMaster.where(id: unit_master_id).first
    if unit_master.present?
      return unit_master.unit_name
    else
      return ""
    end
  end
   
end
