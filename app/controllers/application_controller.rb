class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  
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
end
