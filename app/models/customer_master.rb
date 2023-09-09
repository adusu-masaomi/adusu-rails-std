class CustomerMaster < ApplicationRecord
  paginates_per 200  # 1ページあたり項目表示

  #demo版対応
  MAX_RECORD_COUNT = 11
    
  before_destroy :ensure_id
    
  #締め日区分
  def self.closing_division 
    [["指定日(通常)", 0], ["月末", 1]]
  end
  #支払日区分
  def self.due_division 
    [["当月", 0], ["翌月", 1], ["翌々月", 2]]
  end
    
  #支払銀行
  def self.payment_bank 
    #[["-", 0], ["北越", 1], ["三信(塚野目)", 2], ["三信(本店)", 3]]
    #No.2は会計の銀行マスターと連動させるため空き(第四), NO.5~8も今後増える場合想定し空き
    [["-", 0], ["北越", 1], ["----", 2], ["三信(塚野目)", 3], ["三信(本店)", 4], ["----", 5], ["----", 6],
    ["----", 7], ["----", 8], ["現金", 9]]
  end
    
  #has_many :construction_datum
  has_many :construction_datum, :foreign_key => "customer_id"  # <== 関係を追記
    
  validates :closing_date, presence: true, numericality: :integer
  validates :due_date, presence: true, numericality: :integer

  #demo版対応
  #validate :customer_master_count_must_be_within_limit, on: :create
    
  ##add180123
  #住所に番地等を入れないようにするためのバリデーション(冗長だが他に方法が見当たらない)
  ADDRESS_ERROR_MESSAGE = "番地（番地）は入力できません。"
  ADDRESS_ERROR_MESSAGE_2 = "番地（丁目）は入力できません。"
  ADDRESS_ERROR_MESSAGE_3 = "番地（ハイフン）は入力できません。"
  ADDRESS_ERROR_MESSAGE_4 = "番地（数字）は入力できません。"
   
  validates :address, format: {without: /丁目/ , :message => ADDRESS_ERROR_MESSAGE_2 }
  validates :address, format: {without: /番地/ , :message => ADDRESS_ERROR_MESSAGE }
  #「流通センター」などの地名も有るため、許可する。
	#validates :address, format: {without: /ー/ , :message => ADDRESS_ERROR_MESSAGE_3 }
  #validates :address, format: {without: /−/ , :message => ADDRESS_ERROR_MESSAGE_3 }
  validates :address, format: {without: /-/ , :message => ADDRESS_ERROR_MESSAGE_3 }
   
  #demo版は抹消
  #住所に数値が混じっていた場合も禁止する
  #validate  :address_regex
  #def address_regex
  #  if address.match(/[0-9０-９]+$/)
  #    errors.add :address, ADDRESS_ERROR_MESSAGE_4
  #  end
  #end
  ##add end 
    
  #demo版対応
  def customer_master_count_must_be_within_limit
    errors.add(:base, "デモ版は#{MAX_RECORD_COUNT}件しか登録できません") if CustomerMaster.count >= MAX_RECORD_COUNT
  end
  
	#現状、利用価値が少ないのでチェックしないものとする・・・
	#add 171002
	#validates :search_character, presence: true, length: { maximum: 1 } , :format => {:with => /^[ぁ-んー－]+$/, :multiline => true, :message =>'はひらがなで入力して下さい。'} 
	
	#見積書・請求書等での敬称として使用
	def self.honorific 
    [["様", 0], ["御中", 1]] 
  end
	
	def self.syllabary 
    #[*('あ'..'ん')]   #これだと余計な文字が入るのでNG
    ['あ','い','う','え','お','か','き','く','け','こ','さ','し','す','せ','そ','た','ち','つ','て','と',
     'な','に','ぬ','ね','の','は','ひ','ふ','へ','ほ','ま','み','む','め','も','や','ゆ','よ',
     'ら','り','る','れ','ろ','わ','を','ん']
  end
    
  #add180702
  #CSV出力
  def self.to_csv(options = {})
    CSV.generate do |csv|
      # column_namesはカラム名を配列で返す
      # 例: ["id", "name", "price", "released_on", ...]
	    #csv << column_names
      #csv << ["id", "customer_name", "post"]
        
      #ヘッダ
      csv_column_names = ["id", "得意先名", "郵便番号", "住所", "番地", "アパート・建物", "ＴＥＬ", "ＦＡＸ", "担当者"]
      csv << csv_column_names
        
      all.each do |customer_master|
          
        
        # attributes はカラム名と値のハッシュを返す
        # 例: {"id"=>1, "name"=>"レコーダー", "price"=>3000, ... }
        # valudes_at はハッシュから引数で指定したキーに対応する値を取り出し、配列にして返す
        # 下の行は最終的に column_namesで指定したvalue値の配列を返す
    	  if customer_master.card_not_flag != 1     #年賀状対象外は外す。
		      csv << customer_master.csv_column_values
        end
		  end
    end
  end
  def csv_column_values
    [id, customer_name, post, address, house_number, address2, tel_main, fax_main, responsible1 ]
  end
  
  #特定のIDは削除できないようにする
  def ensure_id
    return true if "#{id}".to_i > 1  #idが1のみ削除できないように
    errors.add(:base, "Cannot delete booking with payments")
    throw :abort  #Rails6
    return false
  end
  
  #ruby6
  def self.ransackable_attributes(auth_object = nil)
    ["address", "address2", "card_not_flag", "closing_date", "closing_date_division", "contact_id", "contractor_flag", "created_at", "customer_name", "due_date", "due_date_division", "email_main", "fax_main", "honorific_id", "house_number", "id", "payment_bank_id", "post", "public_flag", "responsible1", "responsible2", "search_character", "tel_main", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["construction_datum"]
  end
end
