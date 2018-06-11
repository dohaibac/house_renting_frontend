class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :update, :destroy]

  # GET /contracts
  def index
    @contracts = Contract.all
  end

  # GET /contracts/1
  def show
  end

  # GET /contracts/new
  def new
    @contract = Contract.new

    @houses_obj = House.new
    @house = @houses_obj.get_house(params["house_id"])
  end

  # GET /contracts/1/edit
  def edit
  end

  # POST /contracts
  def create
    @cont = Contract.new()
    @contract = @cont.create_contract(contract_params)

    if @contract
      redirect_to contract_path, notice: 'Contract was successfully created.'
    else
      render :new
    end

  end

  # PATCH/PUT /contracts/1
  def update

    @cont = Contract.new()
    @contract = @cont.update_contract(contract_params)

    if @contract
      redirect_to contract_path, notice: 'Contract was successfully updated.'
    else
      render :edit
    end

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contract
      @contract = Contract.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def contract_params
      params.require(:contract).permit(:house_id, :user_id, :contract_date_start, :contract_date_end, :contract_status)
    end
end
