class BranchesController < ApplicationController

  # GET: /branches
  get "/branches" do
    @branches = Branch.all
    # displays all the branches with links to the page that contains their experiments lists too
    erb :"/branches/index.html"
  end

  # GET: /branches/5
  get "/branches/:id" do
    @branch = Branch.find(params[:id])

    erb :"/branches/show.html"
  end

end
