class CompaniesController < ApplicationController

  def new
    @company = Company.new
  end

  def create
    company_params = params.require(:company).permit(:company_name,:location,:email,:phone)
    @company = Company.new(company_params)
    if @company.save
      redirect_to root_path
    else
      flash[:error] = "Preéncha os campos obrigatórios"
      render :new
    end
  end
end
