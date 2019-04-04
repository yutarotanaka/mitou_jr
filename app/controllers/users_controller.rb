class UsersController < ApplicationController
  def signup
  end
  
  def create
    @user = User.create(name: params[:name], email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the Papa!"
      #UserMailer.welcome_email(@user).deliver_later
      redirect_to("/users/#{@user.id}")
     else
      redirect_to :signup, :alert => "errorが起きました"
    end
  end
  
  def login_form
    @user = User.find_by(id:session[:user_id])
    if @user
      redirect_to("/users/#{@user.id}")
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
    else
      render 'edit'
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      #UserMailer.welcome_email(@user).deliver_later
      redirect_to("/users/#{@user.id}")
    else
      @error_message = "＜Login失敗＞　※EmailまたはPasswordが間違っていませんか？　もう一度打ち直してください"
      redirect_to("/login_form")
    end
  end
  
  def logout
    session[:user_id] = nil
    redirect_to("/login_form")
  end
  
  def todolist
    @user = User.find_by(id: params[:id])
    @id = params[:id]
  end
  
  
end
