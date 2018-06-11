class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update, :destroy]

  # GET /houses
  def index
    @houses_obj = House.new
    if session[:user_id] && session[:current_user]["user_type"] == "owner" then
      @houses = @houses_obj.get_house_owner(session[:user_id])
    else
      @houses = @houses_obj.get_all
    end
  end

  # GET /houses/new
  def new
    @house = House.new
  end

  # GET /houses/1/edit
  def edit
  end

  #POST Search the list of houses
  def search_house
    ho = House.new
    @houses = ho.search_house(params[:search])

    if @houses
      render :index
    end
  end
  
  # POST /houses
  def create
    ho = House.new
    @house = ho.create_house(params[:house][:address], params[:house][:province],params[:house][:description],session[:user_id],params[:house][:renting_price])

    if @house
      redirect_to houses_path, notice: 'House was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /houses/1
  def update_house
    ho = House.new
    @house = ho.update_house(params[:house][:id], params[:house][:address], params[:house][:province],params[:house][:description],params[:house][:house_owner],params[:house][:renting_price],params[:house][:house_status])

    if @house
      redirect_to houses_path, notice: 'House was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /houses/1
  def destroy
    ho = House.new
    @house = ho.delete_house(params[:id])
    redirect_to houses_url, notice: 'House was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @houses_obj = House.new
      @house = @houses_obj.get_house(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def house_params
      params.require(:house).permit(:address, :province, :description, :house_owner, :house_status, :renting_price)
    end
end
