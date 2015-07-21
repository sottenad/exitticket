class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_user_time_zone    
    
    #adds additoinal fields to devise.
    #before_action :configure_permitted_parameters, if: :devise_controller?
    #protected
    #def configure_permitted_parameters
        #devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:current_password, :username, :email, :first_name, :last_name, :avatar) }
        #devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:current_password, :username, :email, :first_name, :last_name, :avatar) }
    #    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:current_password, :username, :email, :first_name, :last_name, :avatar, :time_zone) }
    #end

  

  def set_user_time_zone
      
    if !current_teacher.nil? && current_teacher.time_zone.nil?
        Time.zone = current_user.time_zone
    else
        Time.zone = cookies[:jstz_time_zone] 
    end
  end
end
