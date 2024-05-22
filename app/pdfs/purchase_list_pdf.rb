class PurchaseListPDF
    
  
  #def self.create purchase_list
  def self.create(purchase_list, company_id, construction_id)	
	  #仕入表PDF発行

    #@@page_number = 0

    # tlfファイルを読み込む
    @report = Thinreports::Report.new(layout: "#{Rails.root}/app/pdfs/purchase_list_pdf.tlf")


    # Thin ReportsでPDFを作成
    #report = ThinReports::Report.create do |r|

    #ThinReports Editorで作成したファイルを読み込む
    #r.use_layout "#{Rails.root}/app/pdfs/quotation_pdf.tlf" do |config|
    #  config.list(:default) do
    #    events.on :footer_insert do |e|
    #      e.section.item(:footer_message).value("test")
    #    end
    #  end
    #end

	  #report.use_layout "#{Rails.root}/app/pdfs/purchase_list_pdf.tlf" do |config|
    #	 events.on :page_create do |e|

    #  end
	  #end

    #支給品のみ存在しているかチェック
    @only_history_flag = false
    if purchase_list.blank? && construction_id.present?
      storage_inventory_histories = StorageInventoryHistory.where(construction_datum_id: construction_id)
      if storage_inventory_histories.present?
        @construction_datum_id = construction_id
        @only_history_flag = true
      end
    end
    #add end
    
    # 1ページ目を開始
    if !@only_history_flag  #支給品のみの場合は仕入表は印刷しない
      
      @report.start_new_page
      #end
      #r.start_new_page

      # テーブルの値を設定
      # list に表のIDを設定する(デフォルトのID値: default)
      # add_row で列を追加できる
      # ブロック内のrow.valuesで値を設定する

      @flag = nil

      # maxLine = 30
      # lineCount = 0

      #初期化
      @purchase_order_code  = ""
      @purchase_amount_subtotal = 0
      @purchase_amount_total = 0

      #ヘッダの線の色を変える(アデュース仕様)
      #del240409
      #if company_id == 1
      #  report.page.item(:line_3).style(:border_color, 'red')
      #end
      
      #タイトル
      @report.page.item(:print_title).value("仕入表")
      
      #$purchase_data.joins(:purchase_order_datum).order("purchase_order_code, purchase_date, id").each do |purchase_datum| 
      #postgreSQL仕様
      #$purchase_data.joins(:purchase_order_datum).select("purchase_data.*, purchase_order_data.*").order("purchase_order_data.purchase_order_code, purchase_data.purchase_date, purchase_data.id").each do |purchase_datum|
      #upd230919
      #$purchase_data.joins(:purchase_order_datum).select("purchase_data.*, purchase_order_data.purchase_order_code").order("purchase_order_data.purchase_order_code, purchase_data.purchase_date, purchase_data.id").each do |purchase_datum|
      #upd240522
      purchase_list.joins(:purchase_order_datum).select("purchase_data.*, purchase_order_data.purchase_order_code").order("purchase_order_data.purchase_order_code, purchase_data.purchase_date, purchase_data.id").each do |purchase_datum|
        
        #---見出し---
        page_count = @report.page_count.to_s + "頁"
        @report.page.item(:pageno).value(page_count)
      
     
        if @flag.nil? 

          @flag = "1"
       
          #binding.pry
       
          #@construction_data = ConstructionDatum.find(purchase_datum.construction_datum_id)
          if $construction_flag == true
            @report.page.item(:construction_code).value(purchase_datum.construction_datum.construction_code)
            @report.page.item(:construction_name).value(purchase_datum.construction_datum.construction_name)
          
            #支給品用処理追加 add240515
            @construction_datum_id = purchase_datum.construction_datum_id
          end
          if $customer_flag == true
            @report.page.item(:customer_name).value(purchase_datum.construction_datum.CustomerMaster.customer_name)
          end
          #小計(見積金額) 
          #本来ならフッターに設定するべきだが、いまいちわからないため・・
          #report.page.item(:quote_price).value(@quotation_headers.quote_price)
       
        end



        #小計
        if @purchase_order_code  != ""
          if @purchase_order_code  != purchase_datum.purchase_order_datum.purchase_order_code

            @num = @purchase_amount_subtotal
            formatNum()
            @purchase_amount_subtotal = @num
            #report.list(:default).add_row purchase_order_code: @purchase_order_code, purchase_unit_price: "小計", 
            #                              purchase_amount: @purchase_amount_subtotal
            @report.list(:default).add_row do |row2|
                           row2.values purchase_order_code: @purchase_order_code, purchase_unit_price: "小計", 
                                       purchase_amount: @purchase_amount_subtotal
                           row2.item(:lbl_unit_price_multi).visible(false)  #add200716
              #del240409
              #if company_id == 1

              #  row2.item(:line_2).style(:border_color, 'red')
              #  row2.item(:line_14).style(:border_color, 'red')
              #  row2.item(:line_15).style(:border_color, 'red')
              #  row2.item(:line_16).style(:border_color, 'red')
              #  row2.item(:line_17).style(:border_color, 'red')
              #  row2.item(:line_18).style(:border_color, 'red')
              #  row2.item(:line_19).style(:border_color, 'red')
              #  row2.item(:line_20).style(:border_color, 'red')
              #  row2.item(:line_21).style(:border_color, 'red')
              #  row2.item(:line_22).style(:border_color, 'red')
              #  row2.item(:line_23).style(:border_color, 'red')
              #  row2.item(:line_24).style(:border_color, 'red')
              #end
            end
            @purchase_amount_subtotal = 0
          end
        end

        @purchase_order_code  = purchase_datum.purchase_order_datum.purchase_order_code
        #金額小計・合計をセット
        if purchase_datum.purchase_amount.present?
          @purchase_amount_subtotal = @purchase_amount_subtotal + purchase_datum.purchase_amount
          @purchase_amount_total = @purchase_amount_total + purchase_datum.purchase_amount
        end

        #ヘッダの線の色を変える(アデュース仕様)
        #del240409
        #if company_id == 1
        #  report.list(:default).header.item(:line_1).style(:border_color, 'red')
          #
        #  report.list(:default).header.item(:line_4).style(:border_color, 'red')
        #  report.list(:default).header.item(:line_5).style(:border_color, 'red')
        #  report.list(:default).header.item(:line_6).style(:border_color, 'red')
        #  report.list(:default).header.item(:line_7).style(:border_color, 'red')
        #  report.list(:default).header.item(:line_8).style(:border_color, 'red')
        #  report.list(:default).header.item(:line_9).style(:border_color, 'red')
        #  report.list(:default).header.item(:line_10).style(:border_color, 'red')
        #  report.list(:default).header.item(:line_11).style(:border_color, 'red')
        #  report.list(:default).header.item(:line_12).style(:border_color, 'red')
        #  report.list(:default).header.item(:line_13).style(:border_color, 'red')
        #end
        

        #for i in 0..29   #29行分(for test)
        @report.list(:default).add_row do |row|


          #品名のセット
          #フリー入力とマスターからの取得を切り分ける
          if purchase_datum.material_id == 1
            material_name = purchase_datum.material_name
          else
            material_name = purchase_datum.MaterialMaster.material_name
          end
          #品番
          if purchase_datum.material_code == "＜手入力用＞" || purchase_datum.material_code == "-"
            material_code = "-"
          else
            #if purchase_datum.MaterialMaster.material_code != "＜手入力用＞"
            #upd230719
            if purchase_datum.MaterialMaster.present? &&  purchase_datum.MaterialMaster.material_code != "＜手入力用＞"  
              material_code = purchase_datum.MaterialMaster.material_code
            else
              material_code = purchase_datum.material_code
            end  
          end
          #


          ###数値の様式設定
          #仕入単価
          @num = purchase_datum.purchase_unit_price
          formatNum()
          unit_price = @num
          #金額
          @num = purchase_datum.purchase_amount
          formatNum()
          purchase_amount = @num
          #定価
          @num = purchase_datum.list_price
          formatNum()
          list_price = @num
          ###

          #add170307
          #数量は小数点の場合あり、その場合で表示を切り分ける。
          quantity = ""
          first, second = purchase_datum.quantity.to_s.split('.')

          if purchase_datum.quantity.present? 
            if second.to_i > 0
              quantity = sprintf("%.2f", purchase_datum.quantity)
            else
              quantity = sprintf("%.0f", purchase_datum.quantity)
            end
          end
        
          #add240328
          #アデュース仕様
          if purchase_datum.changed_quantity.present?
            #binding.pry
            quantity = sprintf("%.2f", purchase_datum.changed_quantity)
          end
          #
          #
          #

          #binding.pry
          #InventoryHistory.inventory_division[purchase_datum.inventory_division_id.to_i][0]

          #upd171227 入庫の場合は入庫と表示
          if purchase_datum.inventory_division_id.present? && InventoryHistory.inventory_division[purchase_datum.inventory_division_id.to_i][1] == 0
            division_name = InventoryHistory.inventory_division[purchase_datum.inventory_division_id.to_i][0]
          else
            if purchase_datum.PurchaseDivision.present?  #add230701
              division_name = purchase_datum.PurchaseDivision.purchase_division_name
            end 
          end
          #

          row.item(:lbl_unit_price_multi).visible(false)  #add200716

          #数量２が存在した場合は、注釈をつける(単価が２種あるため)
          if purchase_datum.quantity2.present? && purchase_datum.quantity2 > 0
            row.item(:lbl_unit_price_multi).visible(true)
          end
          #

          if purchase_datum.unit_master.present?
            unit_name = purchase_datum.unit_master.unit_name
          else
            unit_name = "-"
          end
          row.values purchase_date: purchase_datum.purchase_date,
                   purchase_order_code: purchase_datum.purchase_order_datum.purchase_order_code,
                   material_code: material_code,
                   material_name: material_name,
                   maker_name: purchase_datum.maker_name,
                   quantity: quantity,
                   unit_name: unit_name,
                   purchase_unit_price: unit_price,
                   purchase_amount: purchase_amount,
                   list_price: list_price,
                   supplier_name: purchase_datum.SupplierMaster.supplier_name,
                   purchase_division_name: division_name


          #(株)アデュース仕様　色を変える(明細側)
          #del240409
          #if company_id == 1
          #  row.item(:line_2).style(:border_color, 'red')

          #  row.item(:line_14).style(:border_color, 'red')
          #  row.item(:line_15).style(:border_color, 'red')
          #  row.item(:line_16).style(:border_color, 'red')
          #  row.item(:line_17).style(:border_color, 'red')
          #  row.item(:line_18).style(:border_color, 'red')
          #   row.item(:line_19).style(:border_color, 'red')
          #  row.item(:line_20).style(:border_color, 'red')
          #  row.item(:line_21).style(:border_color, 'red')
          #  row.item(:line_22).style(:border_color, 'red')
          #  row.item(:line_23).style(:border_color, 'red')
          #  row.item(:line_24).style(:border_color, 'red')
          #end

        end

      end
    
      #end
      #add170302 最終ページの出力はここで定義する
      page_count = @report.page_count.to_s + "頁"
      @report.page.item(:pageno).value(page_count)

      #小計(ラスト分)
      @num = @purchase_amount_subtotal
      formatNum()
      @purchase_amount_subtotal = @num
      #report.list(:default).add_row purchase_order_code: @purchase_order_code, purchase_unit_price: "小計", 
      #                                  purchase_amount: @purchase_amount_subtotal

      @report.list(:default).add_row do |row2| 
        row2.values purchase_order_code: @purchase_order_code, purchase_unit_price: "小計", 
                  purchase_amount: @purchase_amount_subtotal
        row2.item(:lbl_unit_price_multi).visible(false)  #add200716

        #(株)アデュース仕様　色を変える(明細側)
        #if company_id == 1
        #  row2.item(:line_2).style(:border_color, 'red')
        #  row2.item(:line_14).style(:border_color, 'red')
        #  row2.item(:line_15).style(:border_color, 'red')
        #  row2.item(:line_16).style(:border_color, 'red')
        #  row2.item(:line_17).style(:border_color, 'red')
        #  row2.item(:line_18).style(:border_color, 'red')
        #  row2.item(:line_19).style(:border_color, 'red')
        #  row2.item(:line_20).style(:border_color, 'red')
        #  row2.item(:line_21).style(:border_color, 'red')
        #  row2.item(:line_22).style(:border_color, 'red')
        #  row2.item(:line_23).style(:border_color, 'red')
        #  row2.item(:line_24).style(:border_color, 'red')
        #end
      end


    #@purchase_amount_subtotal = 0

      #合計
      @num = @purchase_amount_total
      formatNum()
      @purchase_amount_total = @num
      #report.list(:default).add_row  purchase_unit_price: "合計", 
      #                                  purchase_amount: @purchase_amount_total
      @report.list(:default).add_row do |row2|
        row2.values purchase_unit_price: "合計", 
                  purchase_amount: @purchase_amount_total
        row2.item(:lbl_unit_price_multi).visible(false)  #add200716

        #del240409
        #(株)アデュース仕様  色を変える(明細側)
        #if company_id == 1

        #  row2.item(:line_2).style(:border_color, 'red')
        #  row2.item(:line_14).style(:border_color, 'red')
        #  row2.item(:line_15).style(:border_color, 'red')
        #  row2.item(:line_16).style(:border_color, 'red')
        #  row2.item(:line_17).style(:border_color, 'red')
        #  row2.item(:line_18).style(:border_color, 'red')
        #  row2.item(:line_19).style(:border_color, 'red')
        #  row2.item(:line_20).style(:border_color, 'red')
        #  row2.item(:line_21).style(:border_color, 'red')
        #  row2.item(:line_22).style(:border_color, 'red')
        #  row2.item(:line_23).style(:border_color, 'red')
        #  row2.item(:line_24).style(:border_color, 'red')
        #end
      end
    
    end  #if !@only_history_flag
  
    #支給品用処理追加　add240515
    if @construction_datum_id.present?
      
      @storage_inventory_histories = StorageInventoryHistory.where(construction_datum_id: @construction_datum_id)
      
      if @storage_inventory_histories.present?
        #binding.pry
        inventory_history_list
      end
            
    end
    
    #add end 
    
    # ThinReports::Reportを返す
    return @report

  end
  
  
  #add240515
  #支給品入出庫表出力
  def self.inventory_history_list
    
    #初期化
    @flag = nil
    @purchase_order_code  = ""
    @purchase_amount_subtotal = 0
    @purchase_amount_total = 0
    
    # 1ページ目を開始
    @report.start_new_page layout: "#{Rails.root}/app/pdfs/purchase_list_pdf.tlf"
     
     
    #タイトル
    @report.page.item(:lbl_storage_inventory).visible(true)
    @report.page.item(:print_title).value("仕入表")
    
    @storage_inventory_histories.joins(:purchase_order_datum).select("storage_inventory_histories.*, purchase_order_data.purchase_order_code").
          order("storage_inventory_histories.purchase_order_datum_id, storage_inventory_histories.occurred_date, storage_inventory_histories.id").each do |storage_inventory_history|
       page_count = @report.page_count.to_s + "頁"
       @report.page.item(:pageno).value(page_count)
       
      if @flag.nil? 
        @flag = "1"
        if $construction_flag == true
          @report.page.item(:construction_code).value(storage_inventory_history.construction_datum.construction_code)
          @report.page.item(:construction_name).value(storage_inventory_history.construction_datum.construction_name)
          
          #支給品用処理追加 add240515
          #@construction_datum_id = purchase_datum.construction_datum_id
        end
        if $customer_flag == true
          @report.page.item(:customer_name).value(storage_inventory_history.construction_datum.CustomerMaster.customer_name)
        end
      
      end
       #小計(不要？)
        #if @purchase_order_code  != ""
        #  if @purchase_order_code  != purchase_datum.purchase_order_datum.purchase_order_code
        #    @num = @purchase_amount_subtotal
        #    formatNum()
        #    @purchase_amount_subtotal = @num
        #    @report.list(:default).add_row do |row2|
        #                   row2.values purchase_order_code: @purchase_order_code, purchase_unit_price: "小計", 
        #                               purchase_amount: @purchase_amount_subtotal
        #                   row2.item(:lbl_unit_price_multi).visible(false)  #add200716
        #    end
        #    @purchase_amount_subtotal = 0
        #  end
        #end 
      #小計end
      
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
