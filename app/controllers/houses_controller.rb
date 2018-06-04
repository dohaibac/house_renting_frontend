class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update, :destroy]

  # GET /houses
  def index
    @houses_obj = House.new
    @houses = @houses_obj.get_all
  end

  # GET /houses/1
  def show
  end

  # GET /houses/new
  def new
    @house = House.new
  end

  # GET /houses/1/edit
  def edit
  end

  # POST /houses
  # FAKE: current user = 1
  def create
    ho = House.new
    @house = ho.create_house(params[:house][:address], params[:house][:province],params[:house][:description],"1",params[:house][:renting_price])

    if @house
      redirect_to root_path, notice: 'House was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /houses/1
  def update
    if @house.update(house_params)
      redirect_to @house, notice: 'House was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /houses/1
  def destroy
    @house.destroy
    redirect_to houses_url, notice: 'House was successfully destroyed.'
  end

  def delete_house(house_id)

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @house = House.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def house_params
      params.require(:house).permit(:address, :province, :description, :house_owner, :house_status, :renting_price)
    end
end
