class LecturersController < ApplicationController
  before_action :set_lecturer, only: [:show, :edit, :update, :destroy]

  # GET /lecturers
  def index
    @lecturers = Lecturer.all
  end

  # GET /lecturers/new
  def new
    @lecturer = Lecturer.new
  end

  # GET /lecturers/1/edit
  def edit; end

  # POST /lecturers
  def create
    @lecturer = Lecturer.new(lecturer_params)

    respond_to do |format|
      if @lecturer.save
        format.html { redirect_to lecturers_path, notice: 'Module was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /lecturers/1
  def update
    respond_to do |format|
      if @lecturer.update(lecturer_params)
        format.html { redirect_to lecturers_path, notice: 'Module was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /lecturers/1
  def destroy
    @lecturer.destroy
    respond_to do |format|
      format.html { redirect_to lecturers_url, notice: 'Module was successfully destroyed.' }
    end
  end

  private

  def set_lecturer
    @lecturer = Lecturer.find(params[:id])
  end

  def lecturer_params
    params.require(:lecturer).permit(:name, :directory_url)
  end
end
