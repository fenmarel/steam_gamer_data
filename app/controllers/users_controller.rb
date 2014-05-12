class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    if confirmed_password?
      @user = User.new(user_params)

      if @user.save
        flash[:success] = "Welcome to Steam Gamer Data!"
        login!(@user)
        redirect_to user_url(@user)
      else
        flash.now[:errors] = @user.errors.full_messages
        render :new
      end
    else
      flash.now[:errors] = ["password and confirmation do not match"]
      render :new
    end
  end

  def show
    @user = User.find(params[:id])

    render :show
  end


  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :steam_id)
  end

  def confirmed_password?
    params[:user][:password] == params[:user][:password_confirmation]
  end
end