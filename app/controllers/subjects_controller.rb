class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  # GET /subjects
  def index
    @subjects = Subject.all
  end

  # GET /subjects/1
  def show
    @filtered=params[:tag_id]
    @tag=Tag.find(params[:tag_id]) if @filtered
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
  end

  # GET /subjects/1/edit
  def edit; end

  # POST /subjects
  def create
    @subject = Subject.new(subject_params)

    respond_to do |format|
      if @subject.save
        format.html { redirect_to @subject, notice: 'Module was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /subjects/1
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to @subject, notice: 'Module was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /subjects/1
  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to subjects_url, notice: 'Module was successfully destroyed.' }
    end
  end

  private

  def set_subject
    @subject = Subject.find(params[:id])
    session[:last_subject_id]=@subject.id
  end

  def subject_params
    params.require(:subject).permit(:name, :code, :year, :lecturer_ids)
  end
end
