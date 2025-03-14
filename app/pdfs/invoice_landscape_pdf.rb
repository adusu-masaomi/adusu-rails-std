class InvoiceLandscapePDF
    
  
  #def self.create invoice
  #upd170626
  #def self.create invoice_detail_large_classifications
  def self.create(invoice_detail_large_classifications, company_id)
	#請求書(横)PDF発行
    #新元号対応 190401
    require "date"
    d_heisei_limit = Date.parse("2019/5/1")
       
    
    # tlfファイルを読み込む
    #変数reportはインスタンス変数に変更
    @report = Thinreports::Report.new(layout: "#{Rails.root}/app/pdfs/invoice_landscape_pdf.tlf")

    #@@labor_amount = 0
    @labor_amount_large = 0
    #@@labor_amount_total = 0
    @labor_amount_total_large = 0
         
    # 1ページ目を開始
    @report.start_new_page
       
    @flag = nil
    
    #インボイス番号を出す
    company = Company.first
    
    if company.present?
      #請求書番号
      if company.invoice_number.present?
        invoice_str = "登録番号　" + company.invoice_number
       @report.page.item(:invoice_number).value(invoice_str)
      end
    end
    #
    
    
    #$invoice_detail_large_classifications.order(:line_number).each do |invoice_detail_large_classification|
    #upd170626
    invoice_detail_large_classifications.order(:line_number).each do |invoice_detail_large_classification| 
      #歩掛り合計
      if invoice_detail_large_classification.labor_productivity_unit.present?
        #合計へカウント
        #@@labor_amount += invoice_detail_large_classification.labor_productivity_unit
        #未使用?
        @labor_amount_large += invoice_detail_large_classification.labor_productivity_unit
      end
      
      #歩掛り計合計
      if invoice_detail_large_classification.labor_productivity_unit_total.present?
        if invoice_detail_large_classification.construction_type.to_i != $INDEX_SUBTOTAL  #add 170308
          #合計へカウント
          #@@labor_amount_total += invoice_detail_large_classification.labor_productivity_unit_total
          #未使用?
          @labor_amount_total_large += invoice_detail_large_classification.labor_productivity_unit_total
        end
      end
		   
      #---見出し---
		 
		  
		 
      #消費税率
      #consumption_tax = $consumption_tax_only
      #消費税率(込)
      #consumption_tax_in = $consumption_tax_include
		 
      if @flag.nil? 
        @flag = "1"
        #@invoice_headers = InvoiceHeader.find(invoice_detail_large_classification.invoice_header_id)
        #upd230720
        @invoice_headers = InvoiceHeader.where(id: invoice_detail_large_classification.invoice_header_id).first
        
        @construction_data = nil
        if @invoice_headers.present?
          if ConstructionDatum.exists?(id: @invoice_headers.construction_datum_id)  
            @construction_data = ConstructionDatum.find(@invoice_headers.construction_datum_id)
          end
          
          #@customer_masters = CustomerMaster.find(@invoice_headers.customer_id)
          #upd230720
          @customer_masters = CustomerMaster.where(id: @invoice_headers.customer_id).first
          @construction_costs = ConstructionCost.find_by(construction_datum_id: @invoice_headers.construction_datum_id)
		    end
           
        #消費税
        date_per_ten_start = Date.parse("2019/10/01")   #消費税１０％開始日  
           
        #if @invoice_headers.billing_amount.present?
        if @invoice_headers.present? && @invoice_headers.billing_amount.present?
          #消費税のみの金額
          #if @invoice_headers.invoice_date.nil? || @invoice_headers.invoice_date < date_per_ten_start
          if !(@invoice_headers.invoice_date.nil?) && @invoice_headers.invoice_date < date_per_ten_start
            #8%の場合
            @billing_amount_tax_only = @invoice_headers.billing_amount * $consumption_tax_only
          elsif @invoice_headers.invoice_date.nil?
            #日付ブランクなら現在日付で判定(add191031)
            if Date.today < date_per_ten_start
            #8%の場合
              @billing_amount_tax_only = @invoice_headers.billing_amount * $consumption_tax_only
            else
            #10%の場合。変更時はさらに分岐させる
              @billing_amount_tax_only = @invoice_headers.billing_amount * $consumption_tax_only_per_ten
            end
          else
          #10%の場合
            @billing_amount_tax_only = @invoice_headers.billing_amount * $consumption_tax_only_per_ten
          end
             
          #消費税込み金額
          #if @invoice_headers.invoice_date.nil? || @invoice_headers.invoice_date < date_per_ten_start
          if !(@invoice_headers.invoice_date.nil?) && @invoice_headers.invoice_date < date_per_ten_start
          #8%の場合
            @billing_amount_tax_in = @invoice_headers.billing_amount * $consumption_tax_include
          elsif @invoice_headers.invoice_date.nil?
          #日付ブランクなら現在日付で判定(add191031)
            if Date.today < date_per_ten_start
            #8%の場合
              @billing_amount_tax_in = @invoice_headers.billing_amount * $consumption_tax_include
            else
            #10%の場合。変更時はさらに分岐させる
              @billing_amount_tax_in = @invoice_headers.billing_amount * $consumption_tax_include_per_ten
            end
          else
          #10%の場合
            @billing_amount_tax_in = @invoice_headers.billing_amount * $consumption_tax_include_per_ten
          end
        end  #@invoice_headers.billing_amount.present?
		 		 
        #if @invoice_headers.invoice_date.present?
        if @invoice_headers.present? && @invoice_headers.invoice_date.present?
          @gengou = @invoice_headers.invoice_date
          #元号変わったらここも要変更
          if @gengou >= d_heisei_limit
          #令和
            if @gengou.year - $gengo_minus_ad_2 == 1
            #１年の場合は元年と表記
              @gengou = $gengo_name_2 + "元年#{@gengou.strftime('%-m')}月#{@gengou.strftime('%-d')}日"
            else
              @gengou = $gengo_name_2 + "#{@gengou.year - $gengo_minus_ad_2}年#{@gengou.strftime('%-m')}月#{@gengou.strftime('%-d')}日"
            end
          else
            #平成
            @gengou = $gengo_name + "#{@gengou.year - $gengo_minus_ad}年#{@gengou.strftime('%-m')}月#{@gengou.strftime('%-d')}日"
          end
        end
           
        #見出に確定申告区分が入ってる場合(Zを除く)
        isFinalDivisionHeader = false
        
        if @invoice_headers.present? && @invoice_headers.final_return_division.present? &&
          @invoice_headers.final_return_division < $FINAL_RETURN_DIVISION_Z
           
        #if @invoice_headers.final_return_division.present? &&
        #  @invoice_headers.final_return_division < $FINAL_RETURN_DIVISION_Z
              
          isFinalDivisionHeader = true
          final_return_division_header = @invoice_headers.final_return_division
        end
        #
    
        #小計(見積金額) 
        if @invoice_headers.present? 
          @report.page.item(:billing_amount).value(@invoice_headers.billing_amount)
        end
        ## 右側のヘッダ
        #請求No
        #if @invoice_headers.invoice_code.present?
        if @invoice_headers.present? && @invoice_headers.invoice_code.present?
          @report.page.item(:invoice_code2).value(@invoice_headers.invoice_code) 
        else
          #請求Noが未入力の場合は、見積Noをそのまま出す。
          #?? del230720
          #@report.page.item(:invoice_code2).value(@invoice_headers.invoice_code)
        end
		   
        #工事CD
        if @construction_data.present?
          @report.page.item(:construction_code).value(@construction_data.construction_code) 
        end
           
        #顧客CD
        if @customer_masters.present?
          @report.page.item(:customer_code).value(@customer_masters.id)
		    end
        #見積日付
        @report.page.item(:invoice_date).value(@gengou) 
		   
        #郵便番号(得意先)
        if @invoice_headers.present?
          @report.page.item(:post).value(@invoice_headers.post) 
		    end
        
        #住所(得意先)
        #upd171012 分割された住所を一つにまとめる。
        if @invoice_headers.present?
          all_address = @invoice_headers.address
          if @invoice_headers.house_number.present?
            all_address += @invoice_headers.house_number
          end
          if @invoice_headers.address2.present?
            all_address += "　" + @invoice_headers.address2
          end
        
          @report.page.item(:address).value(all_address) 
        end
        #
		   
        #TEL
        if @invoice_headers.present?
          @report.page.item(:tel).value(@invoice_headers.tel) 
          #FAX
          @report.page.item(:fax).value(@invoice_headers.fax) 
       
          #得意先名
          if @invoice_headers.customer_master.present? 
            @report.page.item(:customer_name2).value(@invoice_headers.customer_master.customer_name) 
		      end
          #件名
          @report.page.item(:construction_name2).value(@invoice_headers.construction_name) 
		    end
        
        #工事期間
        #@report.page.item(:construction_period2).value(@invoice_headers.construction_period) 
		 
        #工事場所
        #@report.page.item(:construction_place2).value(@invoice_headers.construction_place) 
		 
		    if @invoice_headers.present?
          #対象期間
          @report.page.item(:invoice_period_start_date).value(@invoice_headers.invoice_period_start_date)
          @report.page.item(:invoice_period_end_date).value(@invoice_headers.invoice_period_end_date)
		 
          #支払期限
          @report.page.item(:payment_period).value(@invoice_headers.payment_period) 
		   
          #有効期間
          #@report.page.item(:effective_period2).value(@invoice_headers.effective_period) 
		   
          #見積金額合計
          @report.page.item(:billing_amount2).value(@invoice_headers.billing_amount)
          #消費税
          if @billing_amount_tax_only != ""
            @report.page.item(:billing_amount_tax_only).value(@billing_amount_tax_only) 
          end
		   
          #税込金額(合計)
          if @invoice_headers.billing_amount.present?
            @report.page.item(:billing_amount_tax_in).value(@billing_amount_tax_in)
          end
		    end
        
        ##以下抹消(復活する可能性もあるので一応残しておく)
        ##実行金額
        #execution_amount = 0
        # if @invoice_headers.execution_amount.present? && @invoice_headers.execution_amount.to_i > 0 then
        #    #まずは直接実行金額を参照。
        #    execution_amount = @invoice_headers.execution_amount
        # else
        #   #なければ工事集計の費用を出す
        #   if @construction_costs.present?
        #    #@report.page.item(:execution_amount2).value(@invoice_headers.execution_amount)
        #      if @construction_costs.execution_amount.present?
        #         execution_amount = @construction_costs.execution_amount
        #      end
        #   end   
        # end
        #@report.page.item(:execution_amount2).value(execution_amount)
        #@execution_amount_tax_only = 0
        #if execution_amount != 0
        #   @execution_amount_tax_only = execution_amount * consumption_tax   
        #   @report.page.item(:execution_amount_tax_only).value(@execution_amount_tax_only)
        #end
        ##利益
        #profit = @invoice_headers.billing_amount + @billing_amount_tax_only - @invoice_headers.execution_amount - @execution_amount_tax_only
        #if profit > 0
        #  @report.page.item(:profit).value(profit)
        #end
        ###
      end  #@flag.nil?
  
      rowCount = 0
      #for i in 0..29   #29行分(for test)
      @report.list(:default).add_row do |row|
        rowCount += 1
        #仕様の場合に数値・単位をnullにする
        @quantity = invoice_detail_large_classification.quantity
        if @quantity == 0 
          @quantity = ""
        end 
        #小数点以下１位があれば表示、なければ非表示
        if @quantity.present?
          #@quantity = "%.2g" %  @quantity
          #upd250304
          #@quantity = "%.4g" %  @quantity
          @quantity = "%.5g" %  @quantity
          #桁区切り(delimiterは使えないので)
          @quantity = @quantity.to_s.gsub(/(\d)(?=\d{3}+$)/, '\\1,')
        end
 
        @execution_quantity = invoice_detail_large_classification.execution_quantity
        if @execution_quantity == 0 
          @execution_quantity = ""
        end
        #小数点以下１位があれば表示、なければ非表示
        if @execution_quantity.present?
          #@execution_quantity = "%.2g" %  @execution_quantity  
          #upd250304
          #@execution_quantity = "%.4g" %  @execution_quantity
          @execution_quantity = "%.5g" %  @execution_quantity
          #桁区切り(delimiterは使えないので)
          @execution_quantity = @execution_quantity.to_s.gsub(/(\d)(?=\d{3}+$)/, '\\1,')
        end
        if invoice_detail_large_classification.WorkingUnit.present?
          @unit_name = invoice_detail_large_classification.WorkingUnit.working_unit_name
        else
          @unit_name = invoice_detail_large_classification.working_unit_name
        end 
          
        if @unit_name == "<手入力>"
          if invoice_detail_large_classification.working_unit_name != "<手入力>"
            @unit_name = invoice_detail_large_classification.working_unit_name
          else
            @unit_name = ""
          end
        end 
        #  
        
        final_return_division = ""
                      
        #小計、値引きの場合は項目を単価欄に表示させる為の分岐
        case invoice_detail_large_classification.construction_type.to_i
        when $INDEX_SUBTOTAL, $INDEX_DISCOUNT
          item_name = ""
          unit_price_or_notices = invoice_detail_large_classification.working_large_item_name
          execution_unit_price_or_notices = invoice_detail_large_classification.working_large_item_name
          @quantity = ""
          @execution_quantity = ""
          @unit_name = ""
        else
          item_name = invoice_detail_large_classification.working_large_item_name
          #納品書データから工事IDを引っ張る
          if invoice_detail_large_classification.delivery_slip_header_id.present?
            delivery_slip_header = DeliverySlipHeader.where(:id => invoice_detail_large_classification.delivery_slip_header_id).first
            if delivery_slip_header.present?
              #工事IDを引っ張る
              if delivery_slip_header.construction_datum_id.present?
                construction = ConstructionDatum.where(:id => delivery_slip_header.construction_datum_id).first
                if construction.present?
                  item_name += "(" + construction.construction_code + ")"
                end
              end
              #確定区分があれば取得
              if delivery_slip_header.final_return_division.present?
                final_return_division = ConstructionCost.final_division[delivery_slip_header.final_return_division][0]
              #else
              #  #確定区分がなければ、-を出力 -> 登録・未登録の区分けをする為、nullは出力しない
              #  final_return_division = ConstructionCost.final_division[0][0]
              end
            end
          end
          unit_price_or_notices = invoice_detail_large_classification.working_unit_price
          execution_unit_price_or_notices = invoice_detail_large_classification.execution_unit_price
        end
        
        #見出に確定申告区分があれば、1行目に表示させる
        if rowCount == 1
          if isFinalDivisionHeader
            final_return_division = ConstructionCost.final_division[final_return_division_header][0]
          end
        end
        
        
        
        
        #標準版は確定申告区分はカット
        #
        if company_id != 1
          row.values working_large_item_name: item_name,
                   working_large_specification: invoice_detail_large_classification.working_large_specification,
                   #final_return_division: final_return_division,
                   quantity: @quantity,
                   working_unit_name: @unit_name,
                   working_unit_price: unit_price_or_notices,
                   invoice_price: invoice_detail_large_classification.invoice_price
        else
        #(株)アデュース仕様 
          row.values working_large_item_name: item_name,
                   working_large_specification: invoice_detail_large_classification.working_large_specification,
                   final_return_division: final_return_division,
                   quantity: @quantity,
                   working_unit_name: @unit_name,
                   working_unit_price: unit_price_or_notices,
                   invoice_price: invoice_detail_large_classification.invoice_price
        end
      end  #report do end 
    end	   #do end
	   
    @invoice_detail_large_classifications = invoice_detail_large_classifications
		 
    #内訳のデータも取得・出力
    set_detail_data
	   
    # Thin@reports::@reportを返す
    return @report
  
  end
  
  def self.set_detail_data
  
    #見積書(表紙)のページ番号をマイナスさせるためのカウンター。
    @estimation_sheet_pages = @report.page_count 
	 
    #内訳データでループ
    #$invoice_detail_large_classifications.order(:line_number).each do |invoice_detail_large_classification|
    #upd170626
    @invoice_detail_large_classifications.order(:line_number).each do |invoice_detail_large_classification|
	 
      invoice_header_id = invoice_detail_large_classification.invoice_header_id
      invoice_detail_large_classification_id =  invoice_detail_large_classification.id
	    
      #$invoice_detail_middle_classifications = InvoiceDetailMiddleClassification.where(:invoice_header_id => invoice_header_id).
      #                                          where(:invoice_detail_large_classification_id => invoice_detail_large_classification_id).where("id is NOT NULL")
      @invoice_detail_middle_classifications = InvoiceDetailMiddleClassification.where(:invoice_header_id => invoice_header_id).
                                                 where(:invoice_detail_large_classification_id => invoice_detail_large_classification_id).where("id is NOT NULL")
                    
	    #内訳書PDF発行(A4横ver)
      #if $invoice_detail_middle_classifications.present?
      #upd170626
      if @invoice_detail_middle_classifications.present?
        self.invoice_detailed_statement_landscape
      end
    end  #do end
  end
  
  
  def self.invoice_detailed_statement_landscape
	#内訳書PDF発行(A4横ver)
      
    #新元号対応 190401
    require "date"
    d_heisei_limit = Date.parse("2019/5/1")
      
    #@@invoice_price = 0
    @invoice_price = 0
    #@@execution_price = 0
    @execution_price = 0
    #@@labor_productivity_unit = 0
    @labor_productivity_unit = 0
    
    #(＊単独モジュールと違う箇所)
    # 1ページ目を開始
    #@report.start_new_page
    @report.start_new_page layout: "#{Rails.root}/app/pdfs/invoice_detailed_statement_landscape_pdf.tlf"
	   
    @flag = nil
  
    #$invoice_detail_middle_classifications.order(:line_number).each do |invoice_detail_middle_classification|
    @invoice_detail_middle_classifications.order(:line_number).each do |invoice_detail_middle_classification| 
          
      #---見出し---
      if @flag.nil? 
        @flag = "1"
        #@invoice_headers = InvoiceHeader.find(invoice_detail_middle_classification.invoice_header_id)
        #upd230720
        @invoice_headers = InvoiceHeader.where(id: invoice_detail_middle_classification.invoice_header_id).first
      
        #件名
        if @invoice_headers.present?
          @report.page.item(:construction_name).value(@invoice_headers.construction_name) 
		    end
        #請求No
        #if @invoice_headers.invoice_code.present?
        if @invoice_headers.present? && @invoice_headers.invoice_code.present?
          @report.page.item(:invoice_code).value(@invoice_headers.invoice_code) 
        else
        #請求Noが未入力の場合は、見積Noをそのまま出す。
          #?del230720
          #@report.page.item(:invoice_code).value(@invoice_headers.invoice_code) 
        end
           
        #if @invoice_headers.invoice_date.present?
        if @invoice_headers.present? && @invoice_headers.invoice_date.present?
          @gengou = @invoice_headers.invoice_date
             
          #元号変わったらここも要変更
          if @gengou >= d_heisei_limit
          #令和
            if @gengou.year - $gengo_minus_ad_2 == 1
              #１年の場合は元年と表記
              @gengou = $gengo_name_2 + "元年#{@gengou.strftime('%-m')}月#{@gengou.strftime('%-d')}日"
            else
              @gengou = $gengo_name_2 + "#{@gengou.year - $gengo_minus_ad_2}年#{@gengou.strftime('%-m')}月#{@gengou.strftime('%-d')}日"
            end
          else
          #平成
            @gengou = $gengo_name + "#{@gengou.year - $gengo_minus_ad}年#{@gengou.strftime('%-m')}月#{@gengou.strftime('%-d')}日"
          end
             
          @report.page.item(:invoice_date).value(@gengou) 
        end
		   
        #品目名
        @report.page.item(:working_large_item_name).value(invoice_detail_middle_classification.InvoiceDetailLargeClassification.working_large_item_name)
		   
        #仕様名
        @report.page.item(:working_large_specification).value(invoice_detail_middle_classification.InvoiceDetailLargeClassification.working_large_specification)

      end  #@flag.nil? 
				
      @report.list(:default).add_row do |row|
  
        if @page_number != (@report.page_count - @estimation_sheet_pages) then
          #保持用
          #@invoice_price_save = @@invoice_price
          @invoice_price_save = @invoice_price
          #@execution_price_save = @@execution_price
          @execution_price_save = @execution_price
          #@labor_productivity_unit_save = @@labor_productivity_unit
          @labor_productivity_unit_save = @labor_productivity_unit
			  
          if @invoice_price_save > 0
            @report.page.item(:message_sum_header).value("前頁より")
            @report.page.item(:blackets1_header).value("(")
            @report.page.item(:blackets2_header).value(")")
            @report.page.item(:subtotal_header).value(@invoice_price_save)
          end 
        end 
        @page_number = @report.page_count - @estimation_sheet_pages
      
        #仕様の場合に数値・単位をnullにする
        @quantity = invoice_detail_middle_classification.quantity
        if @quantity == 0 
          @quantity = ""
        end  
        #小数点以下１位があれば表示、なければ非表示
        if @quantity.present?
          #@quantity = "%.2g" %  @quantity
          #upd250304
          #@quantity = "%.4g" %  @quantity
          @quantity = "%.5g" %  @quantity
          #桁区切り(delimiterは使えないので)
          @quantity = @quantity.to_s.gsub(/(\d)(?=\d{3}+$)/, '\\1,')
        end
                  
        @execution_quantity = invoice_detail_middle_classification.execution_quantity
        if @execution_quantity == 0 
          @execution_quantity = ""
        end  
        #小数点以下１位があれば表示、なければ非表示
        if @execution_quantity.present?
          #@execution_quantity = "%.2g" %  @execution_quantity
          #upd250304
          #@execution_quantity = "%.4g" %  @execution_quantity
          @execution_quantity = "%.5g" %  @execution_quantity
          #桁区切り(delimiterは使えないので)
          @execution_quantity = @execution_quantity.to_s.gsub(/(\d)(?=\d{3}+$)/, '\\1,')
        end
        if invoice_detail_middle_classification.WorkingUnit.present?
          @unit_name = invoice_detail_middle_classification.WorkingUnit.working_unit_name
        else
          #@unit_name = ""
          @unit_name = invoice_detail_middle_classification.working_unit_name
        end
				  
        if @unit_name == "<手入力>"
          if invoice_detail_middle_classification.working_unit_name != "<手入力>"
            @unit_name = invoice_detail_middle_classification.working_unit_name
          else 
            @unit_name = ""
          end
        end 
                  
        if invoice_detail_middle_classification.invoice_price.present?
          if invoice_detail_middle_classification.construction_type.to_i != $INDEX_SUBTOTAL  #add 170308
            #tmp = invoice_detail_middle_classification.invoice_price.delete("^0-9").to_i
            #標準版対応 230720
            tmp = invoice_detail_middle_classification.invoice_price
            if tmp > 0
              num = invoice_detail_middle_classification.invoice_price.to_i
            else
              num = tmp
            end
            #
            #@@invoice_price += num
            @invoice_price += num
          end
        end
        #実行金額合計
        if invoice_detail_middle_classification.execution_price.present?
          if invoice_detail_middle_classification.construction_type.to_i != $INDEX_SUBTOTAL  
            #tmp = invoice_detail_middle_classification.execution_price.delete("^0-9").to_i
            #upd230720
            tmp = invoice_detail_middle_classification.execution_price
            if tmp > 0
              num = invoice_detail_middle_classification.execution_price.to_i
            else
              num = tmp
            end
            #
            #@@execution_price += num
            @execution_price += num
          end
        end
                  
        #@labor_amount = 0
        #if invoice_detail_middle_classification.execution_quantity.present?
        #  if invoice_detail_middle_classification.execution_quantity >= 0
        #     if invoice_detail_middle_classification.labor_productivity_unit.present?
        #       @labor_amount = invoice_detail_middle_classification.execution_quantity * invoice_detail_middle_classification.labor_productivity_unit
        #       #合計へカウント
        #       @@labor_productivity_unit += @labor_amount
        #     end
        #  end
        #end
        
        #  
        #小計、値引きの場合は項目を単価欄に表示させる為の分岐
        case invoice_detail_middle_classification.construction_type.to_i
        when $INDEX_SUBTOTAL, $INDEX_DISCOUNT
          item_name = ""
          unit_price_or_notices = invoice_detail_middle_classification.working_middle_item_name
          execution_unit_price_or_notices = invoice_detail_middle_classification.working_middle_item_name
          @quantity = ""
          @unit_name = ""
          #歩掛りの計も表示させる
          if invoice_detail_middle_classification.labor_productivity_unit_total != blank?
            @labor_amount = invoice_detail_middle_classification.labor_productivity_unit_total
          end
          #
        else
          item_name = invoice_detail_middle_classification.working_middle_item_name
          unit_price_or_notices = invoice_detail_middle_classification.working_unit_price
          execution_unit_price_or_notices = invoice_detail_middle_classification.execution_unit_price
        
          if invoice_detail_middle_classification.labor_productivity_unit_total != blank?
            @labor_amount = invoice_detail_middle_classification.labor_productivity_unit_total.to_f
            
            #合計へカウント
            #@@labor_productivity_unit += @labor_amount
            @labor_productivity_unit += @labor_amount
          end
        end
        #
        
        if @labor_amount == 0
          @labor_amount = ""
        end
        
        row.values working_middle_item_name: item_name,
                 working_middle_specification: invoice_detail_middle_classification.working_middle_specification, 
                 quantity: @quantity,
                 working_unit_name: @unit_name,
                 working_unit_price: unit_price_or_notices,
                 invoice_price: invoice_detail_middle_classification.invoice_price
                  
      end  #report end do
    #end 
    
      #頁番号
      #(＊単独モジュールと違う箇所)
      page_number = @report.page_count - @estimation_sheet_pages
         
      page_count = "(" +  page_number.to_s + ")"
      @report.page.item(:page_number).value(page_count)
		   
      @report.page.item(:message_sum).value("次頁へ")
      @report.page.item(:blackets1).value("(")
      @report.page.item(:blackets2).value(")")
    
      #@report.page.item(:subtotal).value(@@invoice_price)
      @report.page.item(:subtotal).value(@invoice_price)
    
      #@report.page.item(:blackets3).value("(")
      #@report.page.item(:blackets4).value(")")
      #@report.page.item(:subtotal_execution).value(@@execution_price )
    
      #歩掛り合計
      #@report.page.item(:blackets5).value("(")
      #@report.page.item(:blackets6).value(")")
      #@report.page.item(:subtotal_labor).value(@@labor_productivity_unit )
    
    
    end	 #end do
     
    @report.page.item(:message_sum).value("計")
    
    #改ページの最中はヘッダにも表示
    #@page_number2 = @report.page_count - @estimation_sheet_pages
    
    #カッコを消す
    @report.page.item(:blackets1).value(" ")
    @report.page.item(:blackets2).value(" ")
    #@report.page.item(:blackets3).value(" ")
    #@report.page.item(:blackets4).value(" ")
    #@report.page.item(:blackets5).value(" ")
    #@report.page.item(:blackets6).value(" ")

  end

end


