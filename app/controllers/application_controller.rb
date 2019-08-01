class ApplicationController < ActionController::Base
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

  def current_subject
      Subject.find(session[:last_subject_id])
  end
end
