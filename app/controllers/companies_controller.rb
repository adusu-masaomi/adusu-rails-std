class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
  
    #住所のパラメータ変換
    params[:company][:address] = params[:addressX]
  
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    #住所のパラメータ変換
    params[:company][:address] = params[:addressX]
  
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    #@company.destroy
    check = @company.destroy
    
    respond_to do |format|
      if check
        format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      else
        format.html { redirect_to companies_url, notice: '会社マスターは削除できません' }
      end
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :representative_title, :representative_name, :post, :address, :house_number, 
        :address2, :tel, :fax, :email, :invoice_number, :estimate_material_cost_rate, :estimate_execution_labor_cost, :estimate_labor_cost, 
        :responsible_order, :responsible_estimate, :responsible_invoice,
        :responsible_delivery, :bank_name_1, :bank_branch_name_1, :account_type_1, :account_number_1, 
        :holder_1, :bank_name_2, :bank_branch_name_2, :account_type_2, :account_number_2, :holder_2, :bank_name_3, 
        :bank_branch_name_3, :account_type_3, :account_number_3, :holder_3)
    end
end
