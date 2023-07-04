class Site < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["address", "address2", "created_at", "house_number", "id", "name", "post", "updated_at"]
  end
end
