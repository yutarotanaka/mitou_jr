class StaticPagesController < ApplicationController
  
  before_action :forbid_login_user, {only: [:start]}
  
  def start
    render :layout => false and return
  end

  def console
  end

  def help
  end

  def about
  end

  def user_home
  end
end
