class OrderNumberFaxPDF
    
  
  #def self.create order_number_fax
  def self.create(purchase_order_datum, responsible_name)
  #注文番号fax用PDF発行
 
    # tlfファイルを読み込む
    report = Thinreports::Report.new(layout: "#{Rails.root}/app/pdfs/order_number_fax_pdf.tlf")
       
    # 1ページ目を開始
    report.start_new_page
      
    #---見出し---
    #report.page.item(:supplier_name).value($purchase_order_datum.supplier_master.supplier_name)
    report.page.item(:supplier_name).value(purchase_order_datum.supplier_master.supplier_name)
    #report.page.item(:supplier_responsible_name).value($purchase_order_datum.supplier_master.responsible1)
    report.page.item(:supplier_responsible_name).value(responsible_name)
    
    #注文番号
    #report.page.item(:order_no).value($purchase_order_datum.purchase_order_code)
    report.page.item(:order_no).value(purchase_order_datum.purchase_order_code)
    
    #工事名略名
    #report.page.item(:construction_name).value($purchase_order_datum.alias_name)
    report.page.item(:construction_name).value(purchase_order_datum.alias_name)
    
    #会社名
    company = Company.first
    #report.page.item(:construction_name).value(purchase_order_datum.alias_name)
    report.page.item(:company_name).value(company.name)
    
    #現場住所 --- 標準版対応
    construction_place = ""
    if purchase_order_datum.construction_datum.address.present?
      construction_place = purchase_order_datum.construction_datum.post + "　" +
      purchase_order_datum.construction_datum.address + purchase_order_datum.construction_datum.house_number + 
      purchase_order_datum.construction_datum.address2
    else
      construction_place = "※ご確認下さい"
    end
    report.page.item(:sites_name).value(construction_place)
    ##
    
    #report.list(:default).add_row do |row|
    #           row.values purchase_order_code: purchase_datum.purchase_order_datum.purchase_order_code,
    #	              material_code: purchase_datum.material_code
    #end 
    
    # ThinReports::Reportを返す
    return report

  end  
  
 
end
   
  
 
