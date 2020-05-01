class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :require_sign_in
    before_action :current_user

    def after_sign_in_path_for(resource)
      user_path(current_user)
    end

    def current_company
      @current_company ||= Company.find_by(id: session[:company_id])
    end
  
    def require_sign_in
      redirect_to login_path unless current_company
    end
  
  end
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected
  
    def configure_permitted_parameters
      added_attrs = [:name,:email,:sex,:profile,:profile_photo,:age]
      devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
      devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
      end


end
  
