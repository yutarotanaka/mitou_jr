class LikesController < ApplicationController
    def create
    @current_user = User.find_by(id: session[:user_id])
    @like = Like.new(user_id: @current_user.id, todo_id: params[:todo_id])
    @like.save
    redirect_to("/users/todos/#{params[:todo_id]}")
  end

  def destroy
    @current_user = User.find_by(id: session[:user_id])
    @like = Like.find_by(user_id: @current_user.id, todo_id: params[:todo_id])
    @like.destroy
    redirect_to("/users/todos/#{params[:todo_id]}")
  end
end
