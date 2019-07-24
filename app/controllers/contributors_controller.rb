class ContributorsController < ApplicationController
  def index
    url = 'https://api.github.com/repos/rails/rails/contributors'
    @contributors = HTTParty.get(url)
  end
end
