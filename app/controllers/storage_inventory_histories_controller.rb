class StorageInventoryHistoriesController < ApplicationController
  before_action :set_storage_inventory_history, only: %i[ show edit update destroy ]

  # GET /storage_inventory_histories or /storage_inventory_histories.json
  def index
    #@storage_inventory_histories = StorageInventoryHistory.all
    
    #ransack保持用コード
    query = params[:q]
    query ||= eval(cookies[:recent_search_history].to_s)
    
    #ransack保持用-
    @q = StorageInventoryHistory.ransack(query)
    
    #ransack保持用コード
    search_history = {
    value: params[:q],
    expires: 24.hours.from_now
    }
    cookies[:recent_search_history] = search_history if params[:q].present?
    #
    
    #rails6
    @storage_inventory_histories  = @q.result
    
    #kaminari用設定
    @storage_inventory_histories  = @storage_inventory_histories.page(params[:page])
    
  end

  # GET /storage_inventory_histories/1 or /storage_inventory_histories/1.json
  def show
  end

  # GET /storage_inventory_histories/new
  def new
    @storage_inventory_history = StorageInventoryHistory.new
    
    #初期値をセット(show画面からの遷移時のみ)
    if params[:new_flag] == "1"
      storage_inventory_history_prev = StorageInventoryHistory.where(id: params[:id]).first
      if storage_inventory_history_prev.present?
        @storage_inventory_history.slip_code = storage_inventory_history_prev.slip_code
        @storage_inventory_history.construction_datum_id = storage_inventory_history_prev.construction_datum_id
      end
    end
    
    #標準版仕様--会社IDを取得
    app_get_session_user
  end

  # GET /storage_inventory_histories/1/edit
  def edit
    #標準版仕様--会社IDを取得
    app_get_session_user
  end

  # POST /storage_inventory_histories or /storage_inventory_histories.json
  def create
    @storage_inventory_history = StorageInventoryHistory.new(storage_inventory_history_params)

    respond_to do |format|
      if @storage_inventory_history.save
        
        #支給品在庫も更新する
        update_storage_inventory
        
        format.html { redirect_to storage_inventory_history_url(@storage_inventory_history), notice: "Storage inventory history was successfully created." }
        format.json { render :show, status: :created, location: @storage_inventory_history }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @storage_inventory_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /storage_inventory_histories/1 or /storage_inventory_histories/1.json
  def update
    
    #支給品在庫も更新する
    update_storage_inventory
    
    respond_to do |format|
      if @storage_inventory_history.update(storage_inventory_history_params)
        format.html { redirect_to storage_inventory_history_url(@storage_inventory_history), notice: "Storage inventory history was successfully updated." }
        format.json { render :show, status: :ok, location: @storage_inventory_history }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @storage_inventory_history.errors, status: :unprocessable_entity }
      end
    end
  end

  #支給品在庫を加減する
  def update_storage_inventory
    if params[:action] != "destroy"
      material_master_id = params[:storage_inventory_history][:material_master_id].to_i
      quantity = params[:storage_inventory_history][:quantity].to_i
    else
      #削除の場合
      material_master_id = @storage_inventory_history.material_master_id
      quantity = @storage_inventory_history.quantity.to_i
    end
    
    storage_inventory = StorageInventory.where(material_master_id: material_master_id).first
    
    if storage_inventory.present?
      if params[:action] == "create"
        #新規の場合
        storage_inventory.quantity -= quantity  #出庫分をマイナスする
        storage_inventory.save!
      
      elsif params[:action] == "update"
        #更新
        quantity_before = @storage_inventory_history.quantity
        differ_quantity = (quantity_before - quantity).to_i
        
        storage_inventory.quantity += differ_quantity  #差分を加える
        storage_inventory.save!
      
      elsif params[:action] == "destroy"
        #削除
        storage_inventory.quantity += quantity   #出庫した分を加える
        storage_inventory.save!
      end
    end
  end
  #

  # DELETE /storage_inventory_histories/1 or /storage_inventory_histories/1.json
  def destroy
    
    #支給品在庫も更新する
    update_storage_inventory
    
    @storage_inventory_history.destroy

    respond_to do |format|
      format.html { redirect_to storage_inventory_histories_url, notice: "Storage inventory history was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_storage_inventory_history
      @storage_inventory_history = StorageInventoryHistory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def storage_inventory_history_params
      params.require(:storage_inventory_history).permit(:occurred_date, :slip_code, :purchase_order_datum_id, :construction_datum_id, :material_master_id, :quantity, :unit_price, :amount, :supplier_master_id, :inventory_division_id)
    end
end
