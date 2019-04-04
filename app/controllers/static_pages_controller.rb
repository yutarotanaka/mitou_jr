class StaticPagesController < ApplicationController
  
  before_action :set_current_user
  
  def start
    render :layout => false and return
    if @current_user
       redirect_to("/users/#{@user.id}")
    end
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
