class Schedule < ApplicationRecord
  belongs_to :construction_datum
  
  attr_accessor :construction_datum_id_refer
end
