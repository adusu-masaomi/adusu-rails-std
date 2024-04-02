class PurchaseListAdditionPDF
    
  
  #def self.create purchase_list
  def self.create(purchase_list, company_id, changed_item, changed_quantity, changed_amount)	
	  #仕入表(積算用)PDF発行

    # tlfファイルを読み込む
    report = Thinreports::Report.new(layout: "#{Rails.root}/app/pdfs/purchase_list_pdf.tlf")

    # 1ページ目を開始
    report.start_new_page

    # テーブルの値を設定
    # list に表のIDを設定する(デフォルトのID値: default)
    # add_row で列を追加できる
    # ブロック内のrow.valuesで値を設定する

    @flag = nil

    #初期化
    @purchase_order_code  = ""
    @purchase_amount_subtotal = 0
    @purchase_amount_total = 0

    #ヘッダの線の色を変える(アデュース仕様)
    if company_id == 1
      report.page.item(:line_3).style(:border_color, 'red')
    end
      
    #タイトル
    report.page.item(:print_title).value("仕入表(積算)")
      
    $purchase_data.joins(:purchase_order_datum).select("purchase_data.*, purchase_order_data.purchase_order_code").order("purchase_order_data.purchase_order_code, purchase_data.purchase_date, purchase_data.id").each do |purchase_datum|
      #---見出し---
      page_count = report.page_count.to_s + "頁"
      report.page.item(:pageno).value(page_count)
     
     
      if @flag.nil? 

        @flag = "1"
       
        if $construction_flag == true
          report.page.item(:construction_code).value(purchase_datum.construction_datum.construction_code)
          report.page.item(:construction_name).value(purchase_datum.construction_datum.construction_name)
        end
        if $customer_flag == true
          report.page.item(:customer_name).value(purchase_datum.construction_datum.CustomerMaster.customer_name)
        end
        #小計(見積金額) 
        #本来ならフッターに設定するべきだが、いまいちわからないため・・
        #report.page.item(:quote_price).value(@quotation_headers.quote_price)
       
      end
      
      #積算用対応
      
      #入庫の場合などは非表示にさせる(カウントもしない)
      if changed_item.present? && 
         changed_item[purchase_datum.id] == "D"
        next
      end
      
      #積算する場合の数量・金額に変更
      if changed_item.present? && 
         changed_item[purchase_datum.id] == "1"
        
        purchase_datum.quantity = changed_quantity[purchase_datum.id]
        purchase_datum.purchase_amount = changed_amount[purchase_datum.id]
        
      end
      #
      
      #積算用対応 end

      #小計
      if @purchase_order_code  != ""
        if @purchase_order_code  != purchase_datum.purchase_order_datum.purchase_order_code

          @num = @purchase_amount_subtotal
          formatNum()
          @purchase_amount_subtotal = @num
          #report.list(:default).add_row purchase_order_code: @purchase_order_code, purchase_unit_price: "小計", 
          #                              purchase_amount: @purchase_amount_subtotal
          report.list(:default).add_row do |row2|
                           row2.values purchase_order_code: @purchase_order_code, purchase_unit_price: "小計", 
                                       purchase_amount: @purchase_amount_subtotal
                           row2.item(:lbl_unit_price_multi).visible(false)  #add200716

            if company_id == 1

              row2.item(:line_2).style(:border_color, 'red')
              row2.item(:line_14).style(:border_color, 'red')
              row2.item(:line_15).style(:border_color, 'red')
              row2.item(:line_16).style(:border_color, 'red')
              row2.item(:line_17).style(:border_color, 'red')
              row2.item(:line_18).style(:border_color, 'red')
              row2.item(:line_19).style(:border_color, 'red')
              row2.item(:line_20).style(:border_color, 'red')
              row2.item(:line_21).style(:border_color, 'red')
              row2.item(:line_22).style(:border_color, 'red')
              row2.item(:line_23).style(:border_color, 'red')
              row2.item(:line_24).style(:border_color, 'red')
            end
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
      if company_id == 1
        report.list(:default).header.item(:line_1).style(:border_color, 'red')
        #
        report.list(:default).header.item(:line_4).style(:border_color, 'red')
        report.list(:default).header.item(:line_5).style(:border_color, 'red')
        report.list(:default).header.item(:line_6).style(:border_color, 'red')
        report.list(:default).header.item(:line_7).style(:border_color, 'red')
        report.list(:default).header.item(:line_8).style(:border_color, 'red')
        report.list(:default).header.item(:line_9).style(:border_color, 'red')
        report.list(:default).header.item(:line_10).style(:border_color, 'red')
        report.list(:default).header.item(:line_11).style(:border_color, 'red')
        report.list(:default).header.item(:line_12).style(:border_color, 'red')
        report.list(:default).header.item(:line_13).style(:border_color, 'red')
      end
      #

      #for i in 0..29   #29行分(for test)
      report.list(:default).add_row do |row|


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
        if company_id == 1
          row.item(:line_2).style(:border_color, 'red')

          row.item(:line_14).style(:border_color, 'red')
          row.item(:line_15).style(:border_color, 'red')
          row.item(:line_16).style(:border_color, 'red')
          row.item(:line_17).style(:border_color, 'red')
          row.item(:line_18).style(:border_color, 'red')
          row.item(:line_19).style(:border_color, 'red')
          row.item(:line_20).style(:border_color, 'red')
          row.item(:line_21).style(:border_color, 'red')
          row.item(:line_22).style(:border_color, 'red')
          row.item(:line_23).style(:border_color, 'red')
          row.item(:line_24).style(:border_color, 'red')
        end

      end


    end
    #end
    #add170302 最終ページの出力はここで定義する
    page_count = report.page_count.to_s + "頁"
    report.page.item(:pageno).value(page_count)

    #小計(ラスト分)
    @num = @purchase_amount_subtotal
    formatNum()
    @purchase_amount_subtotal = @num
    #report.list(:default).add_row purchase_order_code: @purchase_order_code, purchase_unit_price: "小計", 
    #                                  purchase_amount: @purchase_amount_subtotal

    report.list(:default).add_row do |row2| 
      row2.values purchase_order_code: @purchase_order_code, purchase_unit_price: "小計", 
                  purchase_amount: @purchase_amount_subtotal
      row2.item(:lbl_unit_price_multi).visible(false)  #add200716

      #(株)アデュース仕様　色を変える(明細側)
      if company_id == 1

        row2.item(:line_2).style(:border_color, 'red')
        row2.item(:line_14).style(:border_color, 'red')
        row2.item(:line_15).style(:border_color, 'red')
        row2.item(:line_16).style(:border_color, 'red')
        row2.item(:line_17).style(:border_color, 'red')
        row2.item(:line_18).style(:border_color, 'red')
        row2.item(:line_19).style(:border_color, 'red')
        row2.item(:line_20).style(:border_color, 'red')
        row2.item(:line_21).style(:border_color, 'red')
        row2.item(:line_22).style(:border_color, 'red')
        row2.item(:line_23).style(:border_color, 'red')
        row2.item(:line_24).style(:border_color, 'red')
      end
    end


    #@purchase_amount_subtotal = 0

    #合計
    @num = @purchase_amount_total
    formatNum()
    @purchase_amount_total = @num
    #report.list(:default).add_row  purchase_unit_price: "合計", 
    #                                  purchase_amount: @purchase_amount_total
    report.list(:default).add_row do |row2|
      row2.values purchase_unit_price: "合計", 
                  purchase_amount: @purchase_amount_total
      row2.item(:lbl_unit_price_multi).visible(false)  #add200716

      #(株)アデュース仕様  色を変える(明細側)
      if company_id == 1

        row2.item(:line_2).style(:border_color, 'red')
        row2.item(:line_14).style(:border_color, 'red')
        row2.item(:line_15).style(:border_color, 'red')
        row2.item(:line_16).style(:border_color, 'red')
        row2.item(:line_17).style(:border_color, 'red')
        row2.item(:line_18).style(:border_color, 'red')
        row2.item(:line_19).style(:border_color, 'red')
        row2.item(:line_20).style(:border_color, 'red')
        row2.item(:line_21).style(:border_color, 'red')
        row2.item(:line_22).style(:border_color, 'red')
        row2.item(:line_23).style(:border_color, 'red')
        row2.item(:line_24).style(:border_color, 'red')
      end
    end
 
    # ThinReports::Reportを返す
    return report

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
