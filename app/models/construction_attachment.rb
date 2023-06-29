class ConstructionAttachment < ApplicationRecord
  belongs_to :construction_datum, optional: true
  #belongs_to :construction_datum, optional: true →not work
  mount_uploader :attachment, AttachmentsUploader
 
 
  
end
