class ChangeDataTypeQuantityOfQuotationDetailMiddleClassification < ActiveRecord::Migration[6.1]
  def change
    change_column :quotation_detail_middle_classifications, :quantity, :float
    change_column :quotation_detail_middle_classifications, :execution_quantity, :float
  end
end
