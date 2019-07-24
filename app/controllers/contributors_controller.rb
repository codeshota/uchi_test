class ContributorsController < ApplicationController
  def index
    if params[:url].blank?
      @contributors = HTTParty.get("https://api.github.com/repos/rails/rails/contributors")
    else
      path = URI(params[:url]).path
      @contributors = HTTParty.get("https://api.github.com/repos#{path}/contributors")
    end
  end

  def show
    respond_to do |format|
      format.html
      
      format.pdf do
        pdf = Prawn::Document.new
        pdf.text "PDF ##{params[:id]}"
        pdf.text "The award go to: #{params[:login]}!"
        send_data pdf.render,
          type: 'application/pdf',
          disposition: 'inline'
          # disposition: 'attachment'
      end
    end
  end
end
