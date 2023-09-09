class SupplierResponsible < ApplicationRecord
  #belongs_to :supplier_master
  #seed対応
  belongs_to :supplier_master, optional: true
  #
  has_many :purchase_order_datum

  #demo版対応
  MAX_RECORD_COUNT = 11

  #demo版対応
  #validate :supplier_responsible_count_must_be_within_limit, on: :create

  #demo版対応
  def supplier_responsible_count_must_be_within_limit
    errors.add(:base, "デモ版は#{MAX_RECORD_COUNT}件しか登録できません") if SupplierResponsible.count >= MAX_RECORD_COUNT
  end

end
