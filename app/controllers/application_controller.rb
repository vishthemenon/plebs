class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def check_permission(object)
    unless object.user_id == current_user.id
      respond_to do |format|
        format.html do
          redirect_to object,
          notice: 'You do not have permission to edit this post'
        end
      end
    end
  end

  protected 

    def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up, keys: [:privacy_policy])
    end
end
