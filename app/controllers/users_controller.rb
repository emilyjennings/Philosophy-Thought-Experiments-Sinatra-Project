class UsersController < ApplicationController

  get "/users/new" do
    erb :"/users/new.html"
  end

  # GET: /users
  get "/users" do
    if logged_in?
      @all_users = User.all
      @user = current_user
      erb :"/users/index.html"
    else
      redirect "/users/new"
    end
  end

  # # POST: /users
  # post "/users" do
  #   @user = User.find_by(username: params[:username])
  #   if @user
  #     @user = User.create(username: params[:username])
  #     @user.save
  #     session[:user_id] = @user.id
  #     redirect "/users"
  #   else
  #     redirect "/users"
  #   end
  # end

  post "/users" do
    @user = User.find_by(username: params[:username])
    if !@user
      @user = User.create(username: params[:username])
      @user.save
      session[:user_id] = @user.id
      redirect "/users"
    else
      session[:user_id] = @user.id
      redirect "/users"
    end
  end

  get "/users/login" do
    erb :"users/login.html"
  end






  # GET: /users/5 - shows a profile page with links to the stories they uploaded
  # get "/users/:id" do
  #   erb :"/users/show.html"
  # end

  get '/users/logout' do
      session.clear
      erb  :"/users/logout"
  end

  # # GET: /users/5/edit
  # get "/users/:id/edit" do
  #   erb :"/users/edit.html"
  # end
  #
  # # PATCH: /users/5
  # patch "/users/:id" do
  #   redirect "/users/:id"
  # end
  #
  # # DELETE: /users/5/delete
  # delete "/users/:id/delete" do
  #   redirect "/users"
  # end
end
