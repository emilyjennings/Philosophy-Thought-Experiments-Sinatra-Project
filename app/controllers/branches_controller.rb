class BranchesController < ApplicationController

  # GET: /branches
  get "/branches" do
    @branches = Branch.all
    # displays all the branches with links to the page that contains their experiments lists too
    erb :"/branches/index.html"
  end

  # GET: /branches/5
  get "/branches/:id" do
    erb :"/branches/show.html"
  end

  # # GET: /branches/new
  # get "/branches/new" do
  #   erb :"/branches/new.html"
  # end
  #
  # # POST: /branches
  # post "/branches" do
  #   redirect "/branches"
  # end
  #

  #
  # # GET: /branches/5/edit
  # get "/branches/:id/edit" do
  #   erb :"/branches/edit.html"
  # end
  #
  # # PATCH: /branches/5
  # patch "/branches/:id" do
  #   redirect "/branches/:id"
  # end
  #
  # # DELETE: /branches/5/delete
  # delete "/branches/:id/delete" do
  #   redirect "/branches"
  # end
end
