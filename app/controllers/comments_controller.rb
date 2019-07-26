class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :check_permission, only: [:edit, :destroy]

  def new
    @comment=current_post.comments.build
  end

  def create
    @comment=current_post.comments.build(comment_params)
    @comment.user_id=current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to current_post, notice: 'Comment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to current_post, notice: 'Comment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to current_post, notice: 'Comment was successfully destroyed.' }
    end
  end

  private

  def set_comment
    @comment=Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def current_post 
    Post.find(session[:last_post_id])
  end

  def check_permission
    unless @comment.user_id==current_user.id
      respond_to do |format|
        format.html { redirect_to current_post, notice: 'You do not have permission to edit this comment' }
      end
    end
  end
end
