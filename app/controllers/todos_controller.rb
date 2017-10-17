class TodosController < ApplicationController
    
    def todo_create
        @user = User.find_by(id: session[:user_id])
        Todo.create(content: params[:content], user_id: @user.id, deadline: params[:deadline], title: params[:title])
        redirect_to("/users/#{@user.id}")
    end
    
    def todo_create_universal
        @user = User.find_by(id: session[:user_id])
        Todo.create(content: params[:content], universal: true, deadline: params[:deadline], title: params[:title])
        redirect_to("/users/#{@user.id}")
    end
    
    def todo_detail
        @current_user = User.find_by(id: session[:user_id])
        @todo = Todo.find_by(id: params[:id])
        @id = params[:id]
        @likes_count = Like.where(todo_id: @todo.id).count
    end
    
    def todo_edit
        @todo = Todo.find_by(id: params[:id])
    end
    
    def todo_update
        @user = User.find_by(id: session[:user_id])
        @todo = Todo.find_by(id: params[:id])
        @todo.deadline = params[:deadline]
        @todo.title = params[:title]
        @todo.content = params[:content]
        @todo.save
        redirect_to("/users/#{@user.id}")
    end
    
    def todo_destroy
        @user = User.find_by(id: session[:user_id])
        @todo = Todo.find_by(id: params[:id])
        @todo.destroy
        redirect_to("/users/#{@user.id}")
    end
end
