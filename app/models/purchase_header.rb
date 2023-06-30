class PurchaseHeader < ApplicationRecord
  paginates_per 200  # 1ページあたり項目表示
  
  #ruby3
  def self.ransackable_attributes(auth_object = nil)
    ["complete_flag", "created_at", "id", "slip_code", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    []
  end
end
