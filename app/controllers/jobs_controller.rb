class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    job_params = params.require(:job).permit(:title,:description,:company_name,
                                             :job_category,:location,:featured)
    @job = Job.new(job_params)
    if @job.save
      redirect_to root_path
    else
      flash[:error] = 'Preéncha os campos obrigatórios'
      flash[:errors] = '*Campo obrigatório'
      render :new
    end
  end
end
