class ReportsController < ApplicationController
before_action :find_reporter

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

  private

  def report_params
    params.require(:report).permit(:reason, :description, :resolved)
  end

  def find_reporter
      @klass=params[:reporter_type].capitalize.constantize
      @reporter=@klass.find(params[:reporter_id])
  end
end
