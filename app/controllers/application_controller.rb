class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    end

    def is_matching_login_user
        if params[:id].to_i() != current_user.id
            redirect_to root_path()
        end
    end
end
