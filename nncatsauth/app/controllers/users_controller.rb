class UsersController < ApplicationController

  before_action :check_login


  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      login(user)
    else
      flash.now[:errors] = user.errors.full_messages
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
