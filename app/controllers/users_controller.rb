class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    user = User.new
    @user = user.create_user(params[:user][:email], params[:user][:password],params[:user][:password_confirmation],params[:user][:user_type],params[:user][:display_name])

    if @user
      redirect_to houses_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :display_name, :user_type)
    end
end
