class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  # helper_method :after_sign_in_path_for
  # helper_method :after_sign_out_path_for
  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :sex, :hobby, :character, :generation, :point, :image, sub_images: []])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :sex, :hobby, :character, :generation, :point, :image, sub_images: []])
    end

    def after_sign_in_path_for(resource)
      case resource
      when User
        users_path 
      when Admin
        admins_users_path
      end
    end
    
    def after_sign_out_path_for(resource)
      case resource
      when User
        root_path 
      when Admin
        root_path
      end
    end
end
