class UsersController < ApplicationController

  #shows a form to log in or a link to create a login
  get "/start" do
    erb :"users/login.html"
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
  # validates the user is real and logs in to a new session

  post "/users" do
    @user = User.find_by(username: params[:username])
    if !@user && !params[:username].empty?
      @user = User.create(username: params[:username], password: params[:password])
      @user.save
      # @user = current_user
      session[:user_id] = @user.id
      redirect "/users"
    else
      redirect "/start"
    end
  end

  #just takes to a login page for a repeat user
  get "/users/new" do
    if !logged_in?
      erb :"/users/new.html"
    else
      flash[:message] = "you're already logged in"
      redirect to '/start'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if !@user || params[:username].empty?
      redirect "/start"
    elsif @user && user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users"
    else
      redirect "/start"
    end
  end

  #logs out and takes to a page to start over again
  get '/users/logout' do
      session.clear
      erb :"/users/logout"
  end

  #shows a profile page with links to the stories they uploaded
  get "/users/:id" do
    @user = User.find_by(id: current_user.id)
    erb :"/users/show.html"
  end



end
