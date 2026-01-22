class WorkingItemListPDF
  
  
  def self.create(quotation_details, large_middle_flag)
  
    # tlfファイルを読み込む
    report = Thinreports::Report.new(layout: "#{Rails.root}/app/pdfs/working_item_list_pdf.tlf")
          
    # 1ページ目を開始
    report.start_new_page
  
    #@working_small_items = WorkingSmallItem.new
    #@array = nil
    #working_small_items = nil
    @working_small_items = []
    
    #quotation_details.order("construction_code desc").each do |construction_datum|
    quotation_details.each do |quotation_detail| 
    
      #working_middle_itemをここから掘り下げる？？
      #一旦、ワークに入れ込む？？
      if large_middle_flag == 1
        item_id = quotation_detail.working_large_item_id
      else
        item_id = quotation_detail.working_middle_item_id
      end
      
      if item_id.present? && item_id != 1
        #明細用ワークへカウント
        working_middle_item = WorkingMiddleItem.where(:id => item_id).first
        
        if working_middle_item.present?
          
          get_small_items(working_middle_item, large_middle_flag)
          
        end
        
      end
      
      ###
    
    end
        
    @working_small_items.sort_by {|x| x["working_small_item_id"] }.each do |working_small_item|
      
      binding.pry
      
      
    end
    
    # ThinReports::Reportを返す
    return report
  
  end
  
   
  def self.get_small_items(working_middle_item, large_middle_flag)
    
    working_small_items = WorkingSmallItem.where(:working_middle_item_id => working_middle_item.id).to_a
    
    #これだとNG...構造体から設計する必要があるかも...
    
    item_name = ""
    
    if large_middle_flag == 1
      item_name = working_middle_item.working_large_item_name
    else
      item_name = working_middle_item.working_middle_item_name
    end
    
    
    #tmp_item = Struct.new(:id, :name, :grade, :age)
    
    if working_small_items.present?
            
      
      working_small_items.each do|working_small_item|
        #最後にworking_middle_item(内訳or明細)の項目を加える
        tmp_item = Struct.new(:id, :working_middle_item_id, :working_small_item_id, 
                              :working_small_item_code, :working_small_item_name, 
                              :rate, :unti_price, :quantity, :material_price, :maker_master_id,
                              :unit_master_id, :item_name, :item_quantity, :working_unit_id)
        #binding.pry
        tmp_work_small_item = tmp_item.new(working_small_item.id, 
                                       working_small_item.working_middle_item_id, 
                                       working_small_item.working_small_item_id,
                                       working_small_item.working_small_item_code, 
                                       working_small_item.working_small_item_name,
                                       working_small_item.rate,
                                       working_small_item.unit_price,
                                       working_small_item.quantity, 
                                       working_small_item.material_price,
                                       working_small_item.maker_master_id,
                                       working_small_item.unit_master_id,
                                       item_name, 
                                       working_middle_item.quantity,
                                       working_middle_item.working_unit_id
                                       )
        
        
        #@working_small_items.push(working_small_item)
        
        @working_small_items << tmp_work_small_item
        
        #if @working_small_items.nil?
        #  @working_small_items = working_small_item
        #  @working_small_items = @working_small_items.to_a
        #else
        #  @working_small_items += working_small_item
        #end
                
        #tmp_item = Struct.new(:id, :name, :grade, :age)
        
      end
    end
          
  end
end