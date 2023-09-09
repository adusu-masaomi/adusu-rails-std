class DropQuoationDetailMiddleClassification < ActiveRecord::Migration[6.1]
  def change
    drop_table :quotation_detail_middle_classifications
  end
end
