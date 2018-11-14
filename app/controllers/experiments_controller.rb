class ExperimentsController < ApplicationController

  # GET: /experiments - lists all experiments and links only if logged in
  get "/experiments" do
    if logged_in?
      @stories = Experiment.all
      erb :"/experiments/index.html"
    else
      redirect :'/users/index'
    end
  end

  # GET: /experiments/new - form for a new experiment
  get "/experiments/new" do
    if logged_in?
      erb :"/experiments/new.html"
    else
      redirect :'/users/index'
    end
  end

  # POST: /experiments - creates a new story and either associates it with the branch or makes a new branch
  post "/experiments" do
    if logged_in?
      if !params[:story].empty?
        @story = Experiment.create(title: params[:title], story: params[:story])
        @story.branch = Branch.find_by(branch: params[:branch])
        @story.save
        redirect "/experiments"
      else
        redirect "/experiments/new"
      end
    end
  end

  # GET: /experiments/5
  get "/experiments/:id" do
    erb :"/experiments/show.html"
  end

  # GET: /experiments/5/edit
  get "/experiments/:id/edit" do
    erb :"/experiments/edit.html"
  end

  # PATCH: /experiments/5
  patch "/experiments/:id" do
    redirect "/experiments/:id"
  end

  # DELETE: /experiments/5/delete
  delete "/experiments/:id/delete" do
    redirect "/experiments"
  end
end
