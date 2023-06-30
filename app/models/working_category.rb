class WorkingCategory < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["category_name", "created_at", "id", "seq", "updated_at"]
  end
end
