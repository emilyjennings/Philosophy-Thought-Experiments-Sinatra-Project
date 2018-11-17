class UsersController < ApplicationController

  #shows a form to create a new user or a link to log in
  get "/start" do
    erb :"/users/new.html"
  end

  # welcome page after logging in
  get "/users" do
    if logged_in?
      @all_users = User.all
      @user = current_user
      erb :"/users/index.html"
    else
      redirect "/start"
    end
  end

  # creates a new user if fields are filled in
  post "/users" do
    @user = User.find_by(username: params[:username])
    if !@user && !params[:username].empty?
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

  #GET: /users/5 - shows a profile page with links to the stories they uploaded
  get "/users/:id" do
    erb :"/users/show.html"
  end

  get '/users/logout' do
      session.clear
      erb  :"/users/logout"
  end

end
