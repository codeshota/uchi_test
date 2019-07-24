class ContributorsController < ApplicationController
  def index
    if params[:q].blank?
      @contributors = HTTParty.get("https://api.github.com/repos/rails/rails/contributors")
    else
      url = params[:q]
      path = URI(url).path
      @contributors = HTTParty.get("https://api.github.com/repos#{path}/contributors")
    end
  end
end
