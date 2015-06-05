class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # the reason we didnt do the @ is because that variable doesnt need to be access outside the create method
    user = User.where(email: user_params[:email]).first
    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      flash[:success] = 'you have been logged in'
      redirect_to home_path
    else
      flash[:error] = 'fail!'
      redirect_to new_session_path

    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'you have been logged out'
    redirect_to home_path
  end
  private
  def user_params
    params.require(:user).permit(:email,:password)

  end
end
