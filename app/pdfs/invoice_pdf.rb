class InvoicePDF
    
  
  #def self.create invoice
  #def self.create(invoice_detail_large_classifications, print_type)
  def self.create(invoice_detail_large_classifications, print_type, company_id)
  #請求書PDF発行
 
    #新元号対応 190401
    require "date"
    d_heisei_limit = Date.parse("2019/5/1")
 
    # tlfファイルを読み込む
    
    #@report = Thinreports::Report.new(layout: "#{Rails.root}/app/pdfs/invoice_pdf.tlf")
    
    @is_company_with_pic = false
    case company_id
    when 1  #(株)アデュース独自仕様
      @is_company_with_pic = true
      #@report = Thinreports::Report.new(layout: "#{Rails.root}/app/pdfs/invoice_signed_pdf.tlf")
      if print_type == "1"
        @report = Thinreports::Report.new(layout: "#{Rails.root}/app/pdfs/invoice_adusu1_pdf.tlf")
      else
        #ハンコ無しVer
        @report = Thinreports::Report.new(layout: "#{Rails.root}/app/pdfs/invoice_adusu2_pdf.tlf")
      end
    else
      #ハンコ無しVer(通常標準版)
      #print_type --1,3で2種類切替も可能
      @report = Thinreports::Report.new(layout: "#{Rails.root}/app/pdfs/invoice_pdf.tlf")
    end
    
    #case print_type
    #when "1"
    ##請求書(印鑑なし)
    #  @report = Thinreports::Report.new(layout: "#{Rails.root}/app/pdfs/invoice_pdf.tlf")
    #when "3"
    ##請求書（印鑑有）--従来様式
    #  @report = Thinreports::Report.new(layout: "#{Rails.root}/app/pdfs/invoice_signed_pdf.tlf")
    #when "4"
    #  #請求書（印鑑有）--新様式--(210522-殆ど使わない)
    #  @report = Thinreports::Report.new(layout: "#{Rails.root}/app/pdfs/invoice_signed_new_pdf.tlf")
    #end
       
    # 1ページ目を開始
    @report.start_new_page
	  
    #見出--標準版仕様
    if !@is_company_with_pic
      set_company_info
    end
    #
  
    @flag = nil
    
    #$invoice_detail_large_classifications.order(:line_number).each do |invoice_detail_large_classification|
    invoice_detail_large_classifications.order(:line_number).each do |invoice_detail_large_classification| 
    
      #---見出し---
      if @flag.nil? 
        
        @flag = "1"
     
        #@invoice_headers = InvoiceHeader.find(invoice_detail_large_classification.invoice_header_id)
        #upd230720
        @invoice_headers = InvoiceHeader.where(id: invoice_detail_large_classification.invoice_header_id).first
     
        #郵便番号(得意先)
        if @invoice_headers.present?
          @report.page.item(:post).value(@invoice_headers.post) 
		    end
		 
        #住所(得意先)
        #分割された住所を一つにまとめる。
        if @invoice_headers.present?
          all_address = @invoice_headers.address
        end
      
        #if @invoice_headers.house_number.present?
        if @invoice_headers.present? && @invoice_headers.house_number.present?
          all_address += @invoice_headers.house_number
        end
        #if @invoice_headers.address2.present?
        if @invoice_headers.present? && @invoice_headers.address2.present?
          all_address += "　" + @invoice_headers.address2
        end
        #@report.page.item(:address).value(@invoice_headers.address) 
        @report.page.item(:address).value(all_address) 
        #  
       
        #得意先名
        #if @invoice_headers.customer_master.present?  #標準版仕様
        if @invoice_headers.present? && @invoice_headers.customer_master.present?  #標準版仕様
          @report.page.item(:customer_name).value(@invoice_headers.customer_master.customer_name) 
        end
        #敬称
        honorific_name = CustomerMaster.honorific[0].find{0}  #"様"
		   
        #if @invoice_headers.honorific_id == 1   #"御中?
        if @invoice_headers.present? && @invoice_headers.honorific_id == 1   #"御中?
          id = @invoice_headers.honorific_id
          honorific_name = CustomerMaster.honorific[id].find{id} #"御中"
        end
        @report.page.item(:honorific).value(honorific_name) 
		   
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
          #  @report.page.item(:invoice_code).value(@invoice_headers.invoice_code) 
        end
		 
        #税抜見積金額
        if @invoice_headers.present?
          @report.page.item(:billing_amount_no_tax).value(@invoice_headers.billing_amount)
        end
        #税込見積合計金額	 
        date_per_ten_start = Date.parse("2019/10/01")   #消費税１０％開始日  add190824
            
        #if @invoice_headers.billing_amount.present?
        if @invoice_headers.present? && @invoice_headers.billing_amount.present?
          if !(@invoice_headers.invoice_date.nil?) && @invoice_headers.invoice_date < date_per_ten_start
          #消費税8%の場合 
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
          #消費税10%の場合 
            @billing_amount_tax_in = @invoice_headers.billing_amount * $consumption_tax_include_per_ten
          end
             
          @report.page.item(:billing_amount_tax_in).value(@billing_amount_tax_in) 
        end
		   
        #消費税のみ金額
        #if @invoice_headers.billing_amount.present?
        if @invoice_headers.present? && @invoice_headers.billing_amount.present?
		     
          #if @invoice_headers.invoice_date.nil? || @invoice_headers.invoice_date < date_per_ten_start
          if !(@invoice_headers.invoice_date.nil?) && @invoice_headers.invoice_date < date_per_ten_start
            #消費税8%の場合
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
            #消費税10%の場合
            @billing_amount_tax_only = @invoice_headers.billing_amount * $consumption_tax_only_per_ten
          end  
             
          @report.page.item(:billing_amount_tax_only).value(@billing_amount_tax_only) 
        end
		 
        #対象期間(開始)
        #if @invoice_headers.invoice_period_start_date.present?
        if @invoice_headers.present? && @invoice_headers.invoice_period_start_date.present?
         
          @gengou = @invoice_headers.invoice_period_start_date
             
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
             
          @report.page.item(:invoice_period_start_date).value(@gengou)
        end
		   
        #対象期間(終了)
        #if @invoice_headers.invoice_period_end_date.present?
        if @invoice_headers.present? && @invoice_headers.invoice_period_end_date.present?
          @gengou = @invoice_headers.invoice_period_end_date
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
             
          @report.page.item(:invoice_period_end_date).value(@gengou)
        end
	
        #支払期限
        if @invoice_headers.present?
          @report.page.item(:payment_period).value(@invoice_headers.payment_period) 
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
        else
          #空白なら最新の元号とする(本来なら切替日で切替必要だがレアケースなので省略)
          if $gengo_name_2.present?  #upd230606
            empty_string =  $gengo_name_2 + "　　" + "年" + "　　" + "月" + "　　" + "日"
            @report.page.item(:invoice_date).value(empty_string) 
          end
        end
		   
       #小計(請求金額) 
       if @invoice_headers.present?
         @report.page.item(:billing_amount).value(@invoice_headers.billing_amount)
       end
      end  #@flag.nil?
		 
      @report.list(:default).add_row do |row|
    
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
        #小計、値引きの場合は項目を単価欄に表示させる為の分岐
        case invoice_detail_large_classification.construction_type.to_i
        when $INDEX_SUBTOTAL, $INDEX_DISCOUNT
          item_name = ""
          unit_price_or_notices = invoice_detail_large_classification.working_large_item_name
          @quantity = ""
          @unit_name = ""
        else
          item_name = invoice_detail_large_classification.working_large_item_name
          unit_price_or_notices = invoice_detail_large_classification.working_unit_price
        end
        #

        #明細欄出力
        row.values working_large_item_name: item_name,
                   working_large_specification: invoice_detail_large_classification.working_large_specification,
                   quantity: @quantity,
                   working_unit_name: @unit_name,
                   working_unit_price: unit_price_or_notices,
                       invoice_price: invoice_detail_large_classification.invoice_price
      end  #report end do
    
    end	 #end do
        
    @invoice_detail_large_classifications = invoice_detail_large_classifications
		
    #内訳のデータも取得・出力
    set_detail_data
       
    # Thin@reports::@reportを返す
    return @report
    
  end
  
  #振込先等、会社情報の表示
  #(標準版仕様)
  def self.set_company_info
    company = Company.first
    
    if company.present?
      
      #請求書番号
      if company.invoice_number.present?
        invoice_str = "登録番号　" + company.invoice_number
       @report.page.item(:invoice_number).value(invoice_str)
      end
      
      
      #会社名
      @report.page.item(:company_name).value(company.name)
      #代表者肩書
      @report.page.item(:representative_title).value(company.representative_title)
      #代表者名
      @report.page.item(:representative_name).value(company.representative_name)
    
      #郵便番号
      @report.page.item(:post_company).value(company.post)
      #住所１
      @report.page.item(:address_company).value(company.address)
      @report.page.item(:address2_company).value(company.address2)
      #番地
      #@report.page.item(:house_number).value(company.house_number)
    
      #TEL
      if company.tel.present?
        tel_str = "TEL:" + company.tel
        @report.page.item(:tel).value(tel_str)
      end
      if company.fax.present?
        fax_str = "FAX:" + company.fax
        @report.page.item(:fax).value(fax_str)
      end
      #
      
      
      #振込先の表示
      
      #振込先１
      
      #口座名義人
      @report.page.item(:holder_1).value(company.holder_1) 
      @report.page.item(:bank_name_1).value(company.bank_name_1) 
      @report.page.item(:bank_branch_name_1).value(company.bank_branch_name_1) 
      #口座種別
      account_type = ""
      if company.account_type_1 == 0
        account_type = "(普)"
      elsif company.account_type_1 == 1
        account_type = "(当)"
      end
      @report.page.item(:account_type_1).value(account_type) 
      @report.page.item(:account_number_1).value(company.account_number_1)
      #
      
      #振込先２
      
      @report.page.item(:holder_2).value(company.holder_2) 
      @report.page.item(:bank_name_2).value(company.bank_name_2) 
      @report.page.item(:bank_branch_name_2).value(company.bank_branch_name_2) 
      #口座種別
      account_type = ""
      if company.account_type_2 == 0
        account_type = "(普)"
      elsif company.account_type_2 == 1
        account_type = "(当)"
      end
      @report.page.item(:account_type_2).value(account_type) 
      @report.page.item(:account_number_2).value(company.account_number_2)
      #
      
      #振込先３
      @report.page.item(:holder_3).value(company.holder_3) 
      @report.page.item(:bank_name_3).value(company.bank_name_3) 
      @report.page.item(:bank_branch_name_3).value(company.bank_branch_name_3) 
      #口座種別
      account_type = ""
      if company.account_type_3 == 0
        account_type = "(普)"
      elsif company.account_type_3 == 1
        account_type = "(当)"
      end
      @report.page.item(:account_type_3).value(account_type) 
      @report.page.item(:account_number_3).value(company.account_number_3)
      #
            
      #
      
    end
  
  end
    
  def self.set_detail_data
     
    #請求書(表紙)のページ番号をマイナスさせるためのカウンター。
    @estimation_sheet_pages = @report.page_count 
	 
    #内訳データでループ
    #$invoice_detail_large_classifications.order(:line_number).each do |invoice_detail_large_classification|
    #upd170626
    @invoice_detail_large_classifications.order(:line_number).each do |invoice_detail_large_classification|
      invoice_header_id = invoice_detail_large_classification.invoice_header_id
	    invoice_detail_large_classification_id =  invoice_detail_large_classification.id
	    
      @invoice_detail_middle_classifications = InvoiceDetailMiddleClassification.where(:invoice_header_id => invoice_header_id).
                                                 where(:invoice_detail_large_classification_id => invoice_detail_large_classification_id).where("id is NOT NULL")
      
	    #内訳書PDF発行(A4横ver)
      if @invoice_detail_middle_classifications.present?
        self.invoice_detailed_statement
      end
    end
  end
  
  def self.invoice_detailed_statement
  #内訳書PDF発行(A4縦ver)
    #新元号対応 190401
    require "date"
    d_heisei_limit = Date.parse("2019/5/1")
  
    #@@invoice_price = 0
    @invoice_price = 0
    
    # 1ページ目を開始
    @report.start_new_page layout: "#{Rails.root}/app/pdfs/invoice_detailed_statement_pdf.tlf"
  
    @flag = nil

    #$invoice_detail_middle_classifications.order(:line_number).each do |invoice_detail_middle_classification|
    #upd170626
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
          #??
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
              @gengou_2 = $gengo_name + "元年#{@gengou.strftime('%-m')}月#{@gengou.strftime('%-d')}日"
            else
              @gengou_2 = $gengo_name + "#{@gengou.year - $gengo_minus_ad_2}年#{@gengou.strftime('%-m')}月#{@gengou.strftime('%-d')}日"
            end
          else
            #平成
            @gengou = $gengo_name + "#{@gengou.year - $gengo_minus_ad}年#{@gengou.strftime('%-m')}月#{@gengou.strftime('%-d')}日"
          end
          
          @report.page.item(:invoice_date).value(@gengou) 
        else
          #空でも文字を出す 
          if $gengou_2.present?  #upd230606
            empty_string =  $gengou_2 + "　　" + "年" + "　　" + "月" + "　　" + "日"
            @report.page.item(:invoice_date).value(empty_string) 
          end
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
        
        if invoice_detail_middle_classification.WorkingUnit.present?
          @unit_name = invoice_detail_middle_classification.WorkingUnit.working_unit_name
        else
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
          if invoice_detail_middle_classification.construction_type.to_i != $INDEX_SUBTOTAL  
            #tmp = invoice_detail_middle_classification.invoice_price.delete("^0-9").to_i
            #upd230616 postgreSQL仕様
            tmp = invoice_detail_middle_classification.invoice_price.to_i
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
                    
        row.values working_middle_item_name: invoice_detail_middle_classification.working_middle_item_name,
                   working_middle_specification: invoice_detail_middle_classification.working_middle_specification, 
                   quantity: @quantity,
                   working_unit_name: @unit_name,
                   working_unit_price: invoice_detail_middle_classification.working_unit_price,
                   invoice_price: invoice_detail_middle_classification.invoice_price
		    
      end  #end report do
    
      #頁番号
      page_number = @report.page_count - @estimation_sheet_pages
    
      page_count = "(" +  page_number.to_s + ")"
      @report.page.item(:page_number).value(page_count)
      @report.page.item(:message_sum).value("次頁へ")
      #@report.page.item(:subtotal).value(@@invoice_price )
      @report.page.item(:subtotal).value(@invoice_price)
      @report.page.item(:blackets1).value("(")
      @report.page.item(:blackets2).value(")")
    
    end	 #end do
      
    @report.page.item(:message_sum).value("計")
    #カッコを消す
    @report.page.item(:blackets1).value(" ")
    @report.page.item(:blackets2).value(" ")
    
  end
  
  #漢数字を数字に変換(未使用だが今後使えそうなので温存)
  def self.num_to_k(n)
    number = 0..9
    kanji = ["","一","二","三","四","五","六","七","八","九"]
    num_kanji = Hash[number.zip(kanji)]
    digit = [1000,100,10]
    # digit = (1..3).map{ |i| 10 ** i }.reverse
    kanji_keta = ["千","百","十"]
    num_kanji_keta = Hash[digit.zip(kanji_keta)]
    num = n
    str = ""
    digit.each { |d|
      tmp = num / d
      str << (tmp == 0 ? "" : ((tmp == 1 ? "" : num_kanji[tmp]) + num_kanji_keta[d]))
      num %= d
    }
    str << num_kanji[num]
  
    return str
  end  
end


