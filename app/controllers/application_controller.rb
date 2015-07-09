class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
    def after_sign_in_path_for(resource)
      if current_user.role == 1
        "/administrador"
      else if current_user.role == 2
          "/notices"
        end
      end
    end
    
    def authorize_admin
      if !current_user
        redirect_to root_path, alert: 'Access Denied, necesita loguerse antes'
        return
      end
      if current_user.role != 1
        redirect_to root_path, alert: 'Acceso Denegado, solo Administradores pueden crear' #unless current_user.admin?
        return
      end
    end
    
    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name,:last_name, :email, :password, :contacto) }
            devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :last_name,:email, :password, :current_password, :contacto, :is_female, :date_of_birth,:avatar) }
        end
        
end
