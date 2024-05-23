class StorageInventoryHistoryListPDF
    
  
  #def self.create purchase_list
  def self.create(storage_inventory_histories, search_flag)	
	  
    #初期化
    @flag = nil
    @purchase_order_code  = ""
    @purchase_amount_subtotal = 0
    @purchase_amount_total = 0
    
     # 1ページ目を開始
    #@report.start_new_page layout: "#{Rails.root}/app/pdfs/purchase_list_pdf.tlf"
    @report = Thinreports::Report.new(layout: "#{Rails.root}/app/pdfs/purchase_list_pdf.tlf")
    
    # 1ページ目を開始
    @report.start_new_page
    
    #タイトル
    @report.page.item(:lbl_storage_inventory).visible(true)
    @report.page.item(:print_title).value("仕入表")
    
    storage_inventory_histories.joins(:purchase_order_datum).select("storage_inventory_histories.*, purchase_order_data.purchase_order_code").
          order("storage_inventory_histories.purchase_order_datum_id, storage_inventory_histories.occurred_date, storage_inventory_histories.id").each do |storage_inventory_history|
       page_count = @report.page_count.to_s + "頁"
       @report.page.item(:pageno).value(page_count)
       
      if @flag.nil? 
        @flag = "1"
        
        if search_flag
        #if $construction_flag == true
          @report.page.item(:construction_code).value(storage_inventory_history.construction_datum.construction_code)
          @report.page.item(:construction_name).value(storage_inventory_history.construction_datum.construction_name)
          
          #支給品用処理追加 add240515
          #@construction_datum_id = purchase_datum.construction_datum_id
        #end
        
        #if $customer_flag == true
          @report.page.item(:customer_name).value(storage_inventory_history.construction_datum.CustomerMaster.customer_name)
        
        end
        
        #end
      
      end
      
      @purchase_order_code  = storage_inventory_history.purchase_order_datum.purchase_order_code
      #金額小計・合計をセット(0だが)
      #if storage_inventory_history.amount.present?
      @purchase_amount_subtotal = @purchase_amount_subtotal + 0
      @purchase_amount_total = @purchase_amount_total + 0
      #end
      
      #明細印刷
      @report.list(:default).add_row do |row|
        #各値をセット
        material_code = storage_inventory_history.material_master.material_code
        material_name = storage_inventory_history.material_master.material_name
        quantity = sprintf("%.0f", storage_inventory_history.quantity)
        #単位名
        unit_name = "-"
        if storage_inventory_history.material_master.present?
          unit_master = UnitMaster.where(id: storage_inventory_history.material_master.unit_id).first
          if unit_master.present?
            unit_name = unit_master.unit_name
          end
        else
          unit_name = "-"
        end
        #単価
        unit_price = sprintf("%.0f", 0)  #単価は0とする
        #金額
        amount = sprintf("%.0f", 0)  #金額は0とする
        #定価
        @num = storage_inventory_history.material_master.list_price
        formatNum()
        list_price = @num
        #入出庫区分
        division_name = InventoryHistory.inventory_division[storage_inventory_history.inventory_division_id.to_i][0]
        #
        
        row.item(:lbl_unit_price_multi).visible(false)  #単価の＊印は非表示にする
        
        row.values purchase_date: storage_inventory_history.occurred_date,
                   purchase_order_code: storage_inventory_history.purchase_order_datum.purchase_order_code,
                   material_code: material_code, material_name: material_name,
                   maker_name: storage_inventory_history.material_master.MakerMaster.maker_name,
                   quantity: quantity, unit_name: unit_name, purchase_unit_price: unit_price,
                   purchase_amount: amount, list_price: list_price,
                   supplier_name: storage_inventory_history.supplier_master.supplier_name,
                   purchase_division_name: division_name
      end  #@report.list do end           
                 
    end  #end do           
    #合計
    #@num = @purchase_amount_total
    #formatNum()
    #@purchase_amount_total = @num
    @report.list(:default).add_row do |row2|
        row2.values purchase_unit_price: "合計", 
                  purchase_amount: @purchase_amount_total
        row2.item(:lbl_unit_price_multi).visible(false) 
    end
    #
 
   
    # ThinReports::Reportを返す
    return @report

  end
 
end



def formatNum()

  if @num.present?
    #整数で四捨五入する
    @num  = @num.round

    #桁区切りにする
    @num  = @num.to_s(:delimited, delimiter: ',')
  else
    @num  = "0"
  end
  # 円マークをつける
  if @num  == "0"
    @num  = ""
  else
    @num  = "￥" + @num 
  end
end
