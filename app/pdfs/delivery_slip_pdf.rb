class DeliverySlipPDF
    
  
  #def self.create delivery_slip	
  #def self.create(delivery_slip_detail_large_classifications, print_type, sort_dm)
  def self.create(delivery_slip_detail_large_classifications, print_type, sort_dm, company_id)
    #納品書PDF発行
    #新元号対応
    require "date"
    d_heisei_limit = Date.parse("2019/5/1")
    
    @sort_dm = sort_dm  #add230426
    
    #if print_type == "1"
     
     
    @is_company_with_pic = false
    case company_id
    when 1  #(株)アデュース用のレポート
      @is_company_with_pic = true
      #@report = Thinreports::Report.new(layout: "#{Rails.root}/app/pdfs/delivery_slip_signed_pdf.tlf")
      
      #if print_type != "3"
      if print_type != "3" && print_type != "5"  #upd240115
        @report = Thinreports::Report.new(layout: "#{Rails.root}/app/pdfs/delivery_slip_adusu1_pdf.tlf")
      else
        #ハンコ無しVer
        @report = Thinreports::Report.new(layout: "#{Rails.root}/app/pdfs/delivery_slip_adusu2_pdf.tlf")
      end
    else
      #通常のユーザーのレポート
      
      #ハンコ無Ver
      @report = Thinreports::Report.new(layout: "#{Rails.root}/app/pdfs/delivery_slip_pdf.tlf")
    end
    
    #else
    #  #ハンコ有Ver
    #  @report = Thinreports::Report.new(layout: "#{Rails.root}/app/pdfs/delivery_slip_signed_pdf.tlf")
    #     
    #end

    #1ページ目を開始
    @report.start_new_page
    @flag = nil 
    
    #振込先等、会社情報の表示
    #(標準版仕様)
    if !@is_company_with_pic
      set_company_info
    end
  
    #$delivery_slip_detail_large_classifications.order(:line_number).each do |delivery_slip_detail_large_classification|
    #upd170626
    delivery_slip_detail_large_classifications.order(:line_number).each do |delivery_slip_detail_large_classification| 
    
      #---見出し---
      if @flag.nil? 
        @flag = "1"
        @delivery_slip_headers = DeliverySlipHeader.find(delivery_slip_detail_large_classification.delivery_slip_header_id)
      
        #郵便番号
        @report.page.item(:post).value(@delivery_slip_headers.post) 
      
        #住所(得意先)
        #分割された住所を一つにまとめる。
        all_address = @delivery_slip_headers.address
        if @delivery_slip_headers.house_number.present?
          all_address += @delivery_slip_headers.house_number
        end
        if @delivery_slip_headers.address2.present?
          all_address += "　" + @delivery_slip_headers.address2
        end
        @report.page.item(:address).value(all_address) 
        #
      
        #得意先名
        if @delivery_slip_headers.customer_master.present?
          @report.page.item(:customer_name).value(@delivery_slip_headers.customer_master.customer_name) 
        end
        
        #敬称
        honorific_name = CustomerMaster.honorific[0].find{0}     #"様"

        if @delivery_slip_headers.honorific_id == 1              #"御中?
          id = @delivery_slip_headers.honorific_id
          honorific_name = CustomerMaster.honorific[id].find{id} #"御中"
        end
        @report.page.item(:honorific).value(honorific_name) 
      
        #担当1
        if @delivery_slip_headers.ConstructionDatum.present? && 
          !@delivery_slip_headers.ConstructionDatum.personnel.blank?
          responsible = @delivery_slip_headers.ConstructionDatum.personnel + "  様"
          @report.page.item(:responsible1).value(responsible)
        else
          #upd241025
          if !@delivery_slip_headers.responsible1.blank?
            #upd241008 件名の入力がない場合でも担当者出すようにする
            responsible = @delivery_slip_headers.responsible1 + "  様"
            @report.page.item(:responsible1).value(responsible)
          end
        end
        #if @delivery_slip_headers.responsible1.present?
        #  responsible = @delivery_slip_headers.responsible1 + "  様"
        #  @report.page.item(:responsible1).value(responsible)
        #end
        #担当2
        if @delivery_slip_headers.responsible2.present?
          responsible = @delivery_slip_headers.responsible2 + "  様"
          @report.page.item(:responsible2).value(responsible)
        end
        #
        #件名
        @report.page.item(:construction_name).value(@delivery_slip_headers.construction_name) 
      
        #納品No
        if @delivery_slip_headers.delivery_slip_code.present?
          @report.page.item(:delivery_slip_code).value(@delivery_slip_headers.delivery_slip_code)
        else
          @report.page.item(:delivery_slip_code).value(@delivery_slip_headers.delivery_slip_code)
        end
    
        #消費税
        date_per_ten_start = Date.parse("2019/10/01")   #消費税１０％開始日 
           
        #税込見積合計金額	 
        if @delivery_slip_headers.delivery_amount.present?
          if @delivery_slip_headers.delivery_slip_date.nil? || @delivery_slip_headers.delivery_slip_date < date_per_ten_start
            #消費税8%
            @delivery_amount_tax_in = @delivery_slip_headers.delivery_amount * $consumption_tax_include  
          else
            #消費税10%
            @delivery_amount_tax_in = @delivery_slip_headers.delivery_amount * $consumption_tax_include_per_ten
          end
          @report.page.item(:delivery_amount_tax_in).value(@delivery_amount_tax_in) 
        end

        #消費税
        if @delivery_slip_headers.delivery_amount.present?
          if @delivery_slip_headers.delivery_slip_date.nil? || @delivery_slip_headers.delivery_slip_date < date_per_ten_start
            #消費税8%
            @delivery_amount_tax_only = @delivery_slip_headers.delivery_amount * $consumption_tax_only  
          else
            #消費税10%
            @delivery_amount_tax_only = @delivery_slip_headers.delivery_amount * $consumption_tax_only_per_ten
          end
          @report.page.item(:delivery_amount_tax_only).value(@delivery_amount_tax_only) 
        end
    
        #工事期間(開始〜終了日も追加)
        construction_period = @delivery_slip_headers.construction_period 
           
        if @delivery_slip_headers.construction_period.present?  #文字が入っていたらスペースを開ける
          construction_period += "　"
        end
           
        #開始日
        if @delivery_slip_headers.construction_period_date1.present?
          #一旦和暦に変換
          japaneseCalendar = ApplicationController.new.WesternToJapaneseCalendar(@delivery_slip_headers.construction_period_date1)
             
          construction_period += japaneseCalendar
        end
           
        if @delivery_slip_headers.construction_period_date1.present? &&
          @delivery_slip_headers.construction_period_date2.present?
          construction_period += " 〜 "
        end
           
        #終了日
        if @delivery_slip_headers.construction_period_date2.present?
          #一旦和暦に変換
          japaneseCalendar = ApplicationController.new.WesternToJapaneseCalendar(@delivery_slip_headers.construction_period_date2)
             
          construction_period += japaneseCalendar
        end
        #
           
        @report.page.item(:construction_period).value(construction_period) 
      
        #住所（工事場所）
        all_address = ""
        address_1 = ""
        address_2 = ""
        #del220430 郵便番号は抹消
        #all_address = @delivery_slip_headers.construction_post + "　"
        all_address += @delivery_slip_headers.construction_place
        if @delivery_slip_headers.construction_house_number.present?
          all_address += @delivery_slip_headers.construction_house_number
        end
           
        address_1 = all_address
           
        if @delivery_slip_headers.construction_place2.present?
          all_address += "　" + @delivery_slip_headers.construction_place2
          address_2 = @delivery_slip_headers.construction_place2
        end
           
        #住所が長い場合は２行にする(自然改行させない)
        if all_address.length <= 25
          @report.page.item(:construction_place).value(all_address)
        else
          @report.page.item(:construction_place_d1).value(address_1)
          @report.page.item(:construction_place_d2).value(address_2)
        end
           
        #納品日
        if @delivery_slip_headers.delivery_slip_date.present?
          @gengou = ApplicationController.new.WesternToJapaneseCalendar(@delivery_slip_headers.delivery_slip_date)
          @report.page.item(:delivery_slip_date).value(@gengou) 
        else
          #空でも文字を出す 
          empty_string =  $gengo_name_2 + "　　" + "年" + "　　" + "月" + "　　" + "日"
          @report.page.item(:delivery_slip_date).value(empty_string) 
        end

        #NET金額
        #if @delivery_slip_headers.net_amount.present?
        #  @net_amount = "(" + @delivery_slip_headers.net_amount.to_s(:delimited, delimiter: ',') + ")" 
        #  @report.page.item(:message_net).value("NET")
        #  @report.page.item(:net_amount).value(@net_amount)
        #end

        #小計(見積金額) 
        #本来ならフッターに設定するべきだが、いまいちわからないため・・
        @report.page.item(:delivery_amount).value(@delivery_slip_headers.delivery_amount)
    
      end  #flag.nil?
  
      @report.list(:default).add_row do |row|
    
        #仕様の場合に数値・単位をnullにする
        @quantity = delivery_slip_detail_large_classification.quantity
        if @quantity == 0 
          @quantity = ""
        end  
        #小数点以下１位があれば表示、なければ非表示
        if @quantity.present?
          #@quantity = "%.4g" %  @quantity
          #upd250306
          #最大５桁とする
          @quantity = "%.5g" %  @quantity
          #桁区切り(delimiterは使えないので)
          @quantity = @quantity.to_s.gsub(/(\d)(?=\d{3}+$)/, '\\1,')
        end
        if delivery_slip_detail_large_classification.WorkingUnit.present?
          @unit_name = delivery_slip_detail_large_classification.WorkingUnit.working_unit_name
        else 
          @unit_name = delivery_slip_detail_large_classification.working_unit_name
        end

        if @unit_name == "<手入力>"
          if delivery_slip_detail_large_classification.working_unit_name != "<手入力>"
            @unit_name = delivery_slip_detail_large_classification.working_unit_name
          else
            @unit_name = ""
          end
        end 
            
        #小計、値引きの場合は項目を単価欄に表示させる為の分岐
        case delivery_slip_detail_large_classification.construction_type.to_i
        when $INDEX_SUBTOTAL, $INDEX_DISCOUNT
          item_name = ""
          unit_price_or_notices = delivery_slip_detail_large_classification.working_large_item_name
          @quantity = ""
          @unit_name = ""
        else
          item_name = delivery_slip_detail_large_classification.working_large_item_name
          unit_price_or_notices = delivery_slip_detail_large_classification.working_unit_price
        end
        #

        #明細欄出力
        row.values working_large_item_name: item_name,
                 working_large_specification: delivery_slip_detail_large_classification.working_large_specification,
                 quantity: @quantity, working_unit_name: @unit_name,
                 working_unit_price: unit_price_or_notices,
                 delivery_slip_price: delivery_slip_detail_large_classification.delivery_slip_price
      end  #report end do
    end	 #end do
        
    @delivery_slip_detail_large_classifications = delivery_slip_detail_large_classifications
       
    #内訳のデータも取得・出力
    set_detail_data
       
    # Thin@reports::@reportを返す
    return @report
  end
  
  def self.set_detail_data
    #納品書(表紙)のページ番号をマイナスさせるためのカウンター。
    @estimation_sheet_pages = @report.page_count 

    #内訳データでループ
    @delivery_slip_detail_large_classifications.order(:line_number).each do |delivery_slip_detail_large_classification|
      
      delivery_slip_header_id = delivery_slip_detail_large_classification.delivery_slip_header_id
      delivery_slip_detail_large_classification_id =  delivery_slip_detail_large_classification.id
    
      @delivery_slip_detail_middle_classifications = DeliverySlipDetailMiddleClassification.where(:delivery_slip_header_id => delivery_slip_header_id).
                                                 where(:delivery_slip_detail_large_classification_id => delivery_slip_detail_large_classification_id).where("id is NOT NULL")

      #内訳書PDF発行(A4横ver)
      if @delivery_slip_detail_middle_classifications.present?
        #@sort_dm = sort_dm
        
        self.delivery_slip_detailed_statement
      end
    end
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
      
    end
  
  end
  
  
  def self.delivery_slip_detailed_statement
    #内訳書PDF発行(A4縦ver)
      
    #新元号対応 190401
    require "date"
    d_heisei_limit = Date.parse("2019/5/1")

    #@@delivery_slip_price = 0
    @delivery_slip_price = 0
    
    # 1ページ目を開始
    @report.start_new_page layout: "#{Rails.root}/app/pdfs/delivery_slip_detailed_statement_pdf.tlf"

    @flag = nil
    
    #ソートしている場合は、並び順を変える
    #if $sort_dm == "asc"
    if @sort_dm == "asc"
      sort_string = "line_number desc"
    else
      sort_string = "line_number asc"
    end
    #

    #$delivery_slip_detail_middle_classifications.order(:line_number).each do |delivery_slip_detail_middle_classification|
    @delivery_slip_detail_middle_classifications.order(sort_string).each do |delivery_slip_detail_middle_classification| 
      #---見出し---
      if @flag.nil? 
        @flag = "1"
        @delivery_slip_headers = DeliverySlipHeader.find(delivery_slip_detail_middle_classification.delivery_slip_header_id)
       
        #件名
        @report.page.item(:construction_name).value(@delivery_slip_headers.construction_name) 
  
        #納品No
        if @delivery_slip_headers.delivery_slip_code.present?
          @report.page.item(:delivery_slip_code).value(@delivery_slip_headers.delivery_slip_code) 
        else
          #納品Noが未入力の場合は、見積Noをそのまま出す。
          @report.page.item(:delivery_slip_code).value(@delivery_slip_headers.delivery_slip_code)
        end

        if @delivery_slip_headers.delivery_slip_date.present?
          @gengou = ApplicationController.new.WesternToJapaneseCalendar(@delivery_slip_headers.delivery_slip_date)
          @report.page.item(:delivery_slip_date).value(@gengou) 
        else
          #空でも文字を出す 
          empty_string =  $gengo_name_2 + "　　" + "年" + "　　" + "月" + "　　" + "日"
          @report.page.item(:delivery_slip_date).value(empty_string) 
        end

        #品目名
        @report.page.item(:working_large_item_name).value(delivery_slip_detail_middle_classification.DeliverySlipDetailLargeClassification.working_large_item_name)

        #仕様名
        @report.page.item(:working_large_specification).value(delivery_slip_detail_middle_classification.DeliverySlipDetailLargeClassification.working_large_specification)
      end  #flag.nil?
      
      @report.list(:default).add_row do |row|
              
        if @page_number != (@report.page_count - @estimation_sheet_pages) then
          #保持用
          #@delivery_slip_price_save = @@delivery_slip_price
          @delivery_slip_price_save = @delivery_slip_price
          if @delivery_slip_price_save > 0
            @report.page.item(:message_sum_header).value("前頁より")
            @report.page.item(:blackets1_header).value("(")
            @report.page.item(:blackets2_header).value(")")
            @report.page.item(:subtotal_header).value(@delivery_slip_price_save)
          end 
        end 
        
        @page_number = @report.page_count - @estimation_sheet_pages

        #仕様の場合に数値・単位をnullにする
        @quantity = delivery_slip_detail_middle_classification.quantity
        if @quantity == 0 
          @quantity = ""
        end  
        #小数点以下１位があれば表示、なければ非表示
        if @quantity.present?
          #@quantity = "%.4g" %  @quantity
          #upd250306
          #最大５桁とする
          @quantity = "%.5g" %  @quantity
        end
        if delivery_slip_detail_middle_classification.WorkingUnit.present?
          @unit_name = delivery_slip_detail_middle_classification.WorkingUnit.working_unit_name
        else 
          @unit_name = delivery_slip_detail_middle_classification.working_unit_name
        end

        if @unit_name == "<手入力>"
          if delivery_slip_detail_middle_classification.working_unit_name != "<手入力>"
            @unit_name = delivery_slip_detail_middle_classification.working_unit_name
          else 
            @unit_name = ""
          end
        end
        #  
        #小計、値引きの場合は項目を単価欄に表示させる為の分岐
        case delivery_slip_detail_middle_classification.construction_type.to_i
        when $INDEX_SUBTOTAL, $INDEX_DISCOUNT
          item_name = ""
          unit_price_or_notices = delivery_slip_detail_middle_classification.working_middle_item_name
          @quantity = ""
          @unit_name = ""
        else
          item_name = delivery_slip_detail_middle_classification.working_middle_item_name
          unit_price_or_notices = delivery_slip_detail_middle_classification.working_unit_price
        end
        #
        
        if delivery_slip_detail_middle_classification.delivery_slip_price.present?
          if delivery_slip_detail_middle_classification.construction_type.to_i != $INDEX_SUBTOTAL  
            #tmp = delivery_slip_detail_middle_classification.delivery_slip_price.delete("^0-9").to_i
            #rails 6
            tmp = delivery_slip_detail_middle_classification.delivery_slip_price
            if tmp > 0
              num = delivery_slip_detail_middle_classification.delivery_slip_price.to_i
            else
              num = tmp
            end
            #
            #@@delivery_slip_price += num
            @delivery_slip_price += num
          end
        end
        
        #標準仕様--備考があればのせる(金額ない場合) 
        delivery_slip_price = ""
        if delivery_slip_detail_middle_classification.delivery_slip_price.present?
          delivery_slip_price = delivery_slip_detail_middle_classification.delivery_slip_price
        else
          delivery_slip_price = delivery_slip_detail_middle_classification.remarks
        end
        #
        
        row.values working_middle_item_name: item_name,
                   working_middle_specification: delivery_slip_detail_middle_classification.working_middle_specification, 
                   quantity: @quantity,
                   working_unit_name: @unit_name,
                   working_unit_price: unit_price_or_notices,
                   #delivery_slip_price: delivery_slip_detail_middle_classification.delivery_slip_price
                   delivery_slip_price: delivery_slip_price
      end  #end report do

      #頁番号
      page_number = @report.page_count - @estimation_sheet_pages
      
      page_count = "(" +  page_number.to_s + ")"
      @report.page.item(:page_number).value(page_count)
      @report.page.item(:message_sum).value("次頁へ")
      #@report.page.item(:subtotal).value(@@delivery_slip_price )
      @report.page.item(:subtotal).value(@delivery_slip_price)
      @report.page.item(:blackets1).value("(")
      @report.page.item(:blackets2).value(")")
    
    end	 #end do
      
    @report.page.item(:message_sum).value("計")
    #カッコを消す
    @report.page.item(:blackets1).value(" ")
    @report.page.item(:blackets2).value(" ")
  
  end
  
  #漢数字を数字に変換(未使用だが使えそうなので消さない事)
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


