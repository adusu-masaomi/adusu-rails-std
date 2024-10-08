class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @purchase_order_datum = PurchaseOrderDatum.new
	@order = Order.new
	
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    	
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      if params[:detail] == "1"
        #注文明細画面から削除した場合
        format.html {redirect_to purchase_order_histories_detail_path( :construction_id => params[:construction_id],
                        :move_flag => params[:move_flag] , :q => params[:q]) }
      
      elsif params[:list] == "1"
        #明細が全て削除されたら、見出しも削除する
        count = Order.where(purchase_order_history_id: @order.purchase_order_history_id).count
        
        if count == 0
          purchase_order_history = PurchaseOrderHistory.find(@order.purchase_order_history_id)
          purchase_order_history.destroy
        end
        #
      
        format.html {redirect_to purchase_order_histories_list_path( :construction_id => params[:construction_id],
                        :move_flag => params[:move_flag] , :q => params[:q]) }
        
      else
        format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      
      end
      
      
      format.json { head :no_content }
    end
  end
  
  def set_delivery_complete_flag
    
    delivery_complete_flag = params[:flag]
    
    #支払フラグをアップデートしておく
    order = Order.find(params[:id])
        
    if order.present?     
      order_params = {delivery_complete_flag: delivery_complete_flag.to_i}
        
      if order.present?
        #ヴァリデーションしない
        order.assign_attributes(order_params)
        order.save!(:validate => false)
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:purchase_order_datum_id, :material_id, :material_code, :material_name, :quantity,
                                    :order_unit_price, :order_price)
    end
	def purchase_order_datum_params
      params.require(:purchase_order_datum).permit(orders_attributes: [:purchase_order_history_id, :material_id, :material_code, :material_name, :quantity, :material_category_id])
    end
end
