class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :set_current_user
  
  def home
    @user = User.find_by(id:session[:user_id])
    if @user
      redirect_to("/users/#{@user.id}")
    else
      redirect_to("/signup")
    end
  end
  
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  
  def forbid_login_user
    if @current_user
      #flash[:notice] = "すでにログインしています"
      redirect_to("/users/#{@current_user.id}")
    end
  end
  
end
