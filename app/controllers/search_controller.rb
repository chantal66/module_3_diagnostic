class SearchController < ApplicationController
  def index
    zipcode = params[:q].split(/\W+/)[-1]

  end
end