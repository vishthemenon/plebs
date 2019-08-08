class ApplicationController < ActionController::Base
layout :layout_by_resource

private

def layout_by_resource
    if devise_controller?
    "devise"
    else
    "application"
    end
end
  # before_action :authenticate_user!
  
  def check_permission
    unless self.user_id == current_user.id
      respond_to do |format|
        format.html do
          redirect_to self,
          notice: 'You do not have permission to edit this post'
        end
      end
    end
  end
end
