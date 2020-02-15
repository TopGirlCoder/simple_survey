class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

  helper_method [:voted]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
 

  def record_not_found
    respond_to do |format|
      format.html { redirect_to surveys_url, notice: 'Record was not found.' }
    end
  end

  def redirect_user
  	redirect_to '/404'
	end
  
  def voted(survey_id)
    session[:surveys] ||= []
    session[:surveys].include?(survey_id) 
  end 

  def add_to_voted(survey_id)
    session[:surveys] << survey_id
  end 

end
