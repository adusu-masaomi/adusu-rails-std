class OutsourcingCost < ApplicationRecord
  #demo
  MAX_RECORD_COUNT = 10
  
  belongs_to :construction_datum, optional: true
  belongs_to :purchase_order_datum, optional: true  #upd190930
  belongs_to :staff, optional: true
  
  attr_accessor :billing_amount_tax
  attr_accessor :payment_total_amount
  
  #add19425
  #支払日入力有で、支払金額が入力されていなければ警告する
  validate :check_payment_amount
  #demo版対応
  validate :outsourcing_cost_count_must_be_within_limit, on: :create
  
  #demo版対応
  def outsourcing_cost_count_must_be_within_limit
    errors.add(:base, "デモ版は#{MAX_RECORD_COUNT}件しか登録できません") if OutsourcingCost.count >= MAX_RECORD_COUNT
  end
  def check_payment_amount
    if payment_date.present?
      if payment_amount.nil? || payment_amount == 0
        errors.add :payment_amount, "を入力して下さい。"
      end
    end
  end
  def self.ransackable_attributes(auth_object = nil)
    ["billing_amount", "closing_date", "construction_datum_id", "created_at", "execution_amount", "id", "invoice_code", "labor_cost", "misellaneous_expense", "payment_amount", "payment_date", "payment_due_date", "purchase_amount", "purchase_order_amount", "purchase_order_datum_id", "source_bank_id", "staff_id", "supplier_master_id", "supplies_expense", "unpaid_amount", "unpaid_payment_date", "updated_at", "working_end_date", "working_start_date"]
  end
end
