class StorageInventoriesController < ApplicationController
  before_action :set_storage_inventory, only: %i[ show edit update destroy ]

  # GET /storage_inventories or /storage_inventories.json
  def index
    @storage_inventories = StorageInventory.all
  end

  # GET /storage_inventories/1 or /storage_inventories/1.json
  def show
  end

  # GET /storage_inventories/new
  def new
    @storage_inventory = StorageInventory.new
  end

  # GET /storage_inventories/1/edit
  def edit
  end

  # POST /storage_inventories or /storage_inventories.json
  def create
    @storage_inventory = StorageInventory.new(storage_inventory_params)

    respond_to do |format|
      if @storage_inventory.save
        format.html { redirect_to storage_inventory_url(@storage_inventory), notice: "Storage inventory was successfully created." }
        format.json { render :show, status: :created, location: @storage_inventory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @storage_inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /storage_inventories/1 or /storage_inventories/1.json
  def update
    respond_to do |format|
      if @storage_inventory.update(storage_inventory_params)
        format.html { redirect_to storage_inventory_url(@storage_inventory), notice: "Storage inventory was successfully updated." }
        format.json { render :show, status: :ok, location: @storage_inventory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @storage_inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /storage_inventories/1 or /storage_inventories/1.json
  def destroy
    @storage_inventory.destroy

    respond_to do |format|
      format.html { redirect_to storage_inventories_url, notice: "Storage inventory was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_storage_inventory
      @storage_inventory = StorageInventory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def storage_inventory_params
      params.require(:storage_inventory).permit(:warehouse_id, :location_id, :material_master_id, :quantity, :unit_master_id, :unit_price)
    end
end
