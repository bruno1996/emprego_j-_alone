class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    job_params = params.require(:job).permit(:title,:description,:company_name,
                                             :job_category,:location)
    @job = Job.new(job_params)
    redirect_to root_path
  end
end
