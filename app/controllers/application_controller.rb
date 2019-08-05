class ApplicationController < ActionController::Base
  helper_method :mistake_count
  
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

  def current_subject
    Subject.find(session[:last_subject_id])
  end

  def current_post 
    Post.find(session[:last_post_id])
  end

  def mistake_count(object)
    object.reports.count do |report|
      report.reason == "Mistake"
    end
  end
end
