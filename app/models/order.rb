class Order < ApplicationRecord
  
  #default_scope { order(id: :asc) }  #add250317
  
  #paginates_per 10  # 1ページあたり項目表示
  #upd220107
  paginates_per 100  # 1ページあたり項目表示
  
  belongs_to :material_master, optional: true, :foreign_key => "material_id"
  belongs_to :unit_master, optional: true
  belongs_to :purchase_order_history
  belongs_to :purchase_order_datum, optional: true
  
  belongs_to :maker_master,optional: true, :foreign_key => "maker_id"
  
  #this is not work well.
  #validates :quantity, numericality: {
  #          only_integer: true, greater_than: 0
  #        }
  
  #メーカーID用
  attr_accessor :maker_id_hide
  
  #明細、分類（選択）用
  #attr_accessor :material_category_id
  
  #単位
  attr_accessor :unit_id_hide
  
  # sequential(gem)用 '1707xx
  acts_as_sequenced scope: :purchase_order_history_id
  
   validate :check_link_count
   def check_link_count
      if self.quantity.nil?
   	    self.errors.add :base, "No more than 5 links allowed."
   		$quantity_nothing = true
   	  end
   end
   
   def self.delivery_complete_check_list 
      [["未", 0], ["済", 1]] 
   end
   
   def self.mail_flag 
    #[["送信済", 1]] 
     #標準はメール使えないため、変更
     [["注文済", 1]] 
   end
   
   def self.issue_flag 
    #[["送信済", 1]] 
     #標準はメール使えないため、変更
     [["発行済", 1]] 
   end
   
   def self.ransackable_attributes(auth_object = nil)
     ["created_at", "delivery_complete_flag", "id", "list_price", "mail_sent_flag", "maker_id", "maker_name", "material_category_id", "material_code", "material_id", "material_name", "order_price", "order_unit_price", "purchase_order_history_id", "quantity", "sequential_id", "unit_master_id", "updated_at"]
   end
   def self.ransackable_associations(auth_object = nil)
     ["maker_master", "material_master", "purchase_order_datum", "purchase_order_history", "unit_master"]
   end

end
