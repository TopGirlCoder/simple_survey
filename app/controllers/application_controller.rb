class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def record_not_found
    respond_to do |format|
      format.html { redirect_to surveys_url, notice: 'Record was not found.' }
    end
  end

  def redirect_user
  	redirect_to '/404'
	end

end
