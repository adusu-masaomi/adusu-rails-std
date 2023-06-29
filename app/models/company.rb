class Company < ApplicationRecord
  MAX_RECORD_COUNT = 1
  
  validate :company_count_must_be_within_limit, on: :create
  before_destroy :ensure_count
  
  #標準版仕様 add230613
  def self.account_type_division 
    [["普通", 0], ["当座", 1]] 
  end
  
  def company_count_must_be_within_limit
    errors.add(:name, "会社は#{MAX_RECORD_COUNT}件しか登録できません") if Company.count >= MAX_RECORD_COUNT
  end
  
  def ensure_count
    return true if Company.count > 1
    errors.add(:base, "Cannot delete booking with payments")
    #errors.add_to_base "The school must have at least one administrator"
    # or errors.add_to_base in Rails 2
    return false
    # Rails 5
    #throw(:abort)
  end
end
