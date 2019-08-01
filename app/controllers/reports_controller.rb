class ReportsController < ApplicationController
before_action :find_reporter, only: [:new, :create]

  def new
    @report=@reporter.reports.build
  end

  def create
    @report=@reporter.reports.build(report_params)
    @report.user_id=current_user.id

    respond_to do |format|
      if @report.save
        format.html { redirect_to current_subject, notice: 'Report was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def mark_as_resolved
    @report=Report.find(params[:id])
    respond_to do |format|
      if @report.update(resolved: true)
        format.html { redirect_to current_post, notice: 'Report was marked as resolved' }
      end
    end
  end

  private

  def report_params
    params.require(:report).permit(:reason, :description, :resolved)
  end

  def find_reporter
      @klass=params[:reporter_type].capitalize.constantize
      @reporter=@klass.find(params[:reporter_id])
  end
end
