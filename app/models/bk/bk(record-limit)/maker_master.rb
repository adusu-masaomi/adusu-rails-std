class MakerMaster < ApplicationRecord
    paginates_per 100  # 1ページあたり項目表示(index.html)
	has_many :PurchaseDatum
	validates :maker_name, uniqueness: true
 
    #ruby3対応
    def self.ransackable_attributes(auth_object = nil)
      ["created_at", "id", "maker_name", "updated_at"]
    end
end