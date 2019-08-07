class CommentsController < ApplicationController
  before_action :set_comment, only: [:update, :destroy]
  before_action :find_commenter, only: [:new, :create]
  before_action only: [:edit, :destroy] do |controller|
    controller.check_permission(@comment)
  end

  def create
    @comment=@commenter.comments.build(comment_params)
    @comment.user_id=current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @commenter, notice: 'Comment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end


  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @commenter, notice: 'Comment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @commenter, notice: 'Comment was successfully destroyed.' }
    end
  end

  private

  def set_comment
    @comment=Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_commenter
    @klass=params[:commenter_type].capitalize.constantize
    @commenter=@klass.find(params[:commenter_id])
  end
end
