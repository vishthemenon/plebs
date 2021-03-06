class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :check_permission, only: [:edit, :destroy]

  def show; end

  def new
    @post=current_subject.posts.build
  end

  def create
    @post=current_subject.posts.build(post_params)
    @post.user_id=current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to current_subject, notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end

  end

  def edit; end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to current_subject, notice: 'Post was successfully destroyed.' }
    end
  end

  private

  def set_post
    @post=Post.find(params[:id])
    session[:last_post_id]=@post.id
  end

  def check_permission
    unless @post.user_id==current_user.id
      respond_to do |format|
        format.html { redirect_to @post, notice: 'You do not have permission to edit this post' }
      end
    end
  end

  def post_params 
    params.require(:post).permit(:title, :body, :document)
  end

  def current_subject
      Subject.find(session[:last_subject_id])
  end
end
