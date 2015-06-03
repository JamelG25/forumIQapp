class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new

  end

  def create

    if User.create user_params

      # flash =hash with a key name success this gets sent to our view = displayed like this  Success => "Message".the the way to show the user a message
      flash[:success] = 'you have been registered'
      redirect_to users_path
    else
      flash[:error] = 'unable to sign you in'
      render :new
    end

  end

  private

  def user_params
    params.require(:user).permit(:email,:password,:password_confirmation)
  end
end
