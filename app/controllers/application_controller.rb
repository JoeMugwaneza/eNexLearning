class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   before_action :store_current_location, :unless => :devise_controller?
   before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
   devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :password_confirmation])
   devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :password_confirmation, :current_password])
  end
  private
    def store_current_location
      if request.get?
        store_location_for(:user, request.url)
      end
    end

    def after_sign_out_path_for(resource)
      request.referrer || root_path
    end

end
