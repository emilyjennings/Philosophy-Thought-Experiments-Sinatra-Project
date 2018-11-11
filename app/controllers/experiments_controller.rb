class ExperimentsController < ApplicationController

  # GET: /experiments
  get "/experiments" do
    erb :"/experiments/index.html"
  end

  # GET: /experiments/new
  get "/experiments/new" do
    erb :"/experiments/new.html"
  end

  # POST: /experiments
  post "/experiments" do
    redirect "/experiments"
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
