class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(login_params)

    if @user
      flash[:success] = ["Welcome Back"]
      login!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = ["Invalid login credentials"]
      render :new
    end
  end



  private

  def login_params
    params.require(:user).permit(:username, :password)
  end
end