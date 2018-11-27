require 'pry'

class ExperimentsController < ApplicationController

  # GET: /experiments - lists all experiments and links only if logged in
  get "/experiments" do
    if logged_in?
      @stories = Experiment.all
      erb :"/experiments/index.html"
    else
      redirect :'/start'
    end
  end

  # GET: /experiments/new - form for a new experiment
  get "/experiments/new" do
    if logged_in?
      erb :"/experiments/new.html"
    else
      redirect :'/start'
    end
  end

  get "/experiments/:id/edit" do
    @story = Experiment.find_by(id: params[:id])
    erb :"/experiments/edit.html"
  end

  patch "/experiments/:id" do
    @story = Experiment.find_by(id: params[:id])
    if current_user.id == @story.user_id
      @story.title = params[:title]
      @story.story = params[:story]
      @story.branch_id = params[:branch_id]
      @story.save
    else
      flash[:message] = "that's not your story to edit"
      redirect :"/experiments"
    end
      flash[:message] = "Updated"
      redirect "/experiments/#{@story.id}"
  end

  # POST: /experiments - creates a new story and either associates it with the branch or makes a new branch
  post "/experiments" do
    if logged_in?
      if !params[:story].empty? && !params[:title].empty?
        @story = Experiment.create(title: params[:title], story: params[:story], branch_id: params[:branch_id])
        @story.user_id = current_user.id
        @story.save
        redirect "/experiments"
      else
        redirect "/experiments/new"
      end
    end
  end

  get "/experiments/:id" do
    @story = Experiment.find(params[:id])
    erb :"/experiments/show.html"
  end

  delete "/experiments/:id/delete" do
    @story = Experiment.find_by(id: params[:id])
    if current_user.id == @story.user_id
      @story.destroy
      redirect "/experiments"
    else
      flash[:message] = "Not Deleted! That's not your story."
      redirect "/experiments"
    end
  end
end
