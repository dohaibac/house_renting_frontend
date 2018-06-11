class SessionController < ApplicationController
	def login
		@user = User.new
	end

	def logout
    session.delete(:user_id)
    session.delete(:current_user)
    redirect_to houses_path, notice: 'You was loged out successful.'
	end

	def create
		user = User.new
    @user = user.signin(params[:user][:email], params[:user][:password])

    if @user
      session[:user_id] = @user["user"]["id"]
      session[:current_user] = @user["user"]

      redirect_to houses_path, notice: 'Welcome to out Renting Application'
    else
      render :new
    end
	end

	private
    # Only allow a trusted parameter "white list" through.
    def session_params
      params.require(:user).permit(:email, :password)
    end
end
