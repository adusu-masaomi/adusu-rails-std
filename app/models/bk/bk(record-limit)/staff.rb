class Staff < ApplicationRecord
    belongs_to :affiliation, optional: true
    has_many :construction_daily_reports
end
