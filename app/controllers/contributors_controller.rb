class ContributorsController < ApplicationController
  def index
    if params[:url].blank?
      @contributors = HTTParty.get("https://api.github.com/repos/rails/rails/contributors")
    else
      path = URI(params[:url]).path
      @contributors = HTTParty.get("https://api.github.com/repos#{path}/contributors")
    end
  end
end
