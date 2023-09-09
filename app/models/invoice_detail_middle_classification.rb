class InvoiceDetailMiddleClassification < ApplicationRecord
  #belongs_to :InvoiceHeader, :foreign_key => "invoice_header_id"
  #belongs_to :InvoiceDetailLargeClassification, :foreign_key => "invoice_detail_large_classification_id"
  #seed用!! 終わったら↑戻す
  belongs_to :InvoiceHeader, optional: true, :foreign_key => "invoice_header_id"
  belongs_to :InvoiceDetailLargeClassification,  optional: true, :foreign_key => "invoice_detail_large_classification_id"
  #
  
  belongs_to :WorkingUnit, optional: true, :foreign_key => "working_unit_id"
  
  #行挿入用
  attr_accessor :check_line_insert
  
  #マスターセット用
  attr_accessor :check_update_item
  attr_accessor :check_update_all
  
  #短縮名手入力用(add170822)
  attr_accessor :working_middle_item_short_name_manual
  
  def self.serial_number
    [[("<行選択>").to_s , (1..999).to_a ]]
  end 
  
  #add170223
  #del170308
  #def self.types 
  #  [["通常", 0], ["配管配線工事", 1], ["機器取付工事", 2], ["労務費", 3]] 
  #end
  
  #金額合計(請求)
  def self.sumpriceInvoice  
    #sum(:invoice_price)
	  #工事種別が通常かまたは値引の場合のみ合算。
    #where("invoice_detail_middle_classifications.construction_type = ? or 
    #  invoice_detail_middle_classifications.construction_type = ? ", "0", $INDEX_DISCOUNT.to_s ).sum(:invoice_price)
    #Rails6対応 upd230719 ↑これだとdistinctされてしまう
    where("invoice_detail_middle_classifications.construction_type = ? or 
      invoice_detail_middle_classifications.construction_type = ? ", "0", $INDEX_DISCOUNT.to_s ).where.not(invoice_price: nil).sum(&:invoice_price)
      

  end
  #金額合計(実行)
  def self.sumpriceExecution  
    #sum(:execution_price)
    
    #工事種別が通常かまたは値引の場合のみ合算。
    #where("invoice_detail_middle_classifications.construction_type = ? or 
      #invoice_detail_middle_classifications.construction_type = ? ", "0", $INDEX_DISCOUNT.to_s ).sum(:execution_price)
    #Rails6対応 upd230719 ↑これだとdistinctされてしまう
    where("invoice_detail_middle_classifications.construction_type = ? or 
      invoice_detail_middle_classifications.construction_type = ? ", "0", $INDEX_DISCOUNT.to_s ).where.not(execution_price: nil).sum(&:execution_price)
  
  end
  #合計(歩掛り)
  def self.sumLaborProductivityUnit 
    sum(:labor_productivity_unit).round(3)
  end 
   #合計(歩掛り計)
  def self.sumLaborProductivityUnitTotal 
    #sum(:labor_productivity_unit_total).round(3)
    #upd170306
    #where(:construction_type => "0").sum(:labor_productivity_unit_total).round(3)
	#upd170308
    #工事種別が通常かまたは値引の場合のみ合算。
    #where("invoice_detail_middle_classifications.construction_type = ? or 
      #invoice_detail_middle_classifications.construction_type = ? ", "0", $INDEX_DISCOUNT.to_s ).sum(:labor_productivity_unit_total).round(3)
    #Rails6対応 upd230719 ↑これだとdistinctされてしまう
    where("invoice_detail_middle_classifications.construction_type = ? or 
      invoice_detail_middle_classifications.construction_type = ? ", "0", $INDEX_DISCOUNT.to_s ).where.not(labor_productivity_unit_total: nil).sum(&:labor_productivity_unit_total).round(3)
  end 
  
  #scope
  
  #add170223
  #合計(歩掛り-配管配線集計用)
  scope :sum_LPU_PipingWiring, -> invoice_header_id, invoice_detail_large_classification_id {where(:piping_wiring_flag => 1).where(invoice_header_id: invoice_header_id ).
                                   where(invoice_detail_large_classification_id: invoice_detail_large_classification_id ).sum(:labor_productivity_unit)}
  #合計(歩掛り計-配管配線集計用)
  scope :sum_LPUT_PipingWiring, -> invoice_header_id, invoice_detail_large_classification_id {where(:piping_wiring_flag => 1).where(invoice_header_id: invoice_header_id ).
                                    where(invoice_detail_large_classification_id: invoice_detail_large_classification_id ).sum(:labor_productivity_unit_total)}
  #合計(歩掛り-機器取付集計用)
  scope :sum_LPU_equipment_mounting, -> invoice_header_id, invoice_detail_large_classification_id {where(:equipment_mounting_flag => 1).where(invoice_header_id: invoice_header_id ).
                                    where(invoice_detail_large_classification_id: invoice_detail_large_classification_id ).sum(:labor_productivity_unit)}
  #合計(歩掛り-機器取付集計用)
  scope :sum_LPUT_equipment_mounting, -> invoice_header_id, invoice_detail_large_classification_id {where(:equipment_mounting_flag => 1).where(invoice_header_id: invoice_header_id ).
                                    where(invoice_detail_large_classification_id: invoice_detail_large_classification_id ).sum(:labor_productivity_unit_total)}
  #合計(歩掛り-労務費集計用)
  scope :sum_LPU_labor_cost, -> invoice_header_id, invoice_detail_large_classification_id {where(:labor_cost_flag => 1).where(invoice_header_id: invoice_header_id ).
                                    where(invoice_detail_large_classification_id: invoice_detail_large_classification_id ).sum(:labor_productivity_unit)}
  #合計(歩掛り-労務費集計用)
  scope :sum_LPUT_labor_cost, -> invoice_header_id, invoice_detail_large_classification_id {where(:labor_cost_flag => 1).where(invoice_header_id: invoice_header_id ).
                                    where(invoice_detail_large_classification_id: invoice_detail_large_classification_id ).sum(:labor_productivity_unit_total)}
  #add end
  
  scope :with_header_id, -> (invoice_detail_middle_classifications_invoice_header_id=1) { joins(:InvoiceHeader).where("invoice_headers.id = ?", invoice_detail_middle_classifications_invoice_header_id )}
  #scope :with_large_item, -> (invoice_detail_middle_classifications_invoice_detail_large_classification_id=1) { joins(:InvoiceDetailLargeClassification).where("invoice_detail_large_classifications.working_large_item_name = ?", invoice_detail_middle_classifications_invoice_detail_large_classification_id )}
  
  #upd170308
  scope :with_large_item, -> (invoice_detail_middle_classifications_invoice_detail_large_classification_id=1, hoge ) { joins(:InvoiceDetailLargeClassification)
        .where("invoice_detail_large_classifications.working_large_item_name = ?", invoice_detail_middle_classifications_invoice_detail_large_classification_id )
        .where("invoice_detail_large_classifications.working_large_specification = ?", hoge ) }
  
  scope :with_large_item_name, -> (invoice_detail_middle_classifications_invoice_detail_large_classification_id=1, item_name ) { joins(:InvoiceDetailLargeClassification)
        .where("invoice_detail_large_classifications.working_large_item_name = ?", item_name) }

  def self.ransackable_scopes(auth_object=nil)
     [:with_header_id, :with_large_item, :with_large_item_name]
  end
  def self.ransackable_attributes(auth_object = nil)
    ["accessory_cost", "construction_type", "created_at", "equipment_mounting_flag", "execution_price", "execution_quantity", "execution_unit_price", "id", "invoice_detail_large_classification_id", "invoice_header_id", "invoice_item_division_id", "invoice_price", "labor_cost_flag", "labor_cost_total", "labor_productivity_unit", "labor_productivity_unit_total", "labor_unit_price", "line_number", "material_cost_total", "material_id", "material_quantity", "material_unit_price", "other_cost", "piping_wiring_flag", "quantity", "remarks", "updated_at", "working_material_name", "working_middle_item_id", "working_middle_item_name", "working_middle_item_short_name", "working_middle_specification", "working_unit_id", "working_unit_name", "working_unit_price"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["InvoiceDetailLargeClassification", "InvoiceHeader", "WorkingUnit"]
  end
end
