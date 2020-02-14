class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

  helper_method [:voted]
  
  def voted(survey_id)
    session[:surveys] ||= []
    session[:surveys].include?(survey_id) 
  end 

  def add_to_voted(survey_id)
    session[:surveys] << survey_id
  end 

end
