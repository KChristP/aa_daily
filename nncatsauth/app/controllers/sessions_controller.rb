class SessionsController < ApplicationController

  before_action :check_login, except: [:destroy, :index, :show]
  before_action :authenticate, only: [:index]

  def new

  end

  def show
    @session = Session.find(params[:id])
  end

  def create
    user = User.find_by_credentials(user_params[:user_name], user_params[:password])
    login(user)
  end

  def index
    @sessions = current_user.sessions
  end

  def destroy
    @session = Session.find(params[:id])
    @session.destroy
    if @session == current_session
      session[:session_token] = nil
      redirect_to new_session_url
    else
      redirect_to sessions_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
