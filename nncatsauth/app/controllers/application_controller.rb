class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :current_session

  def current_user
    @current_user ||= current_session ? current_session.user : nil
  end

  def login(user)
    if user
      token = user.create_session(request.remote_ip)
      session[:session_token] = token
      redirect_to cats_url
    else
      flash.now[:errors] = ["Invalid Login Credentials"]
      render :new
    end
  end

  def check_login
    redirect_to cats_url if current_user
  end

  def authenticate
    unless current_user
      flash[:errors] = ["You must log in before doing whatever you just did"]
      redirect_to new_session_url
    end
  end

  def current_session
    @current_session ||= Session.includes(:user).find_by(token: session[:session_token])
  end
end
