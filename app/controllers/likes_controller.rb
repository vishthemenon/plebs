class LikesController < ApplicationController
  def create
    @like=current_post.likes.build
    @like.user_id=current_user.id

    respond_to do |format|
      if @like.save
        format.html { redirect_to current_post }
      else
        format.html { redirect_to current_post }
      end
    end
  end

  def destroy
    @like=Like.find_by(user_id: current_user.id, likeable_id: current_post.id)
    respond_to do |format|
      if @like
        @like.destroy
        format.html { redirect_to current_post }
      else
        format.html { redirect_to current_post }
      end
    end
  end

  private

  def current_post
    Post.find(session[:last_post_id])
  end
end
