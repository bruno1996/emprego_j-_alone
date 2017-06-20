require 'rails_helper'

  feature 'user register job' do
    scenario 'successfully' do
      company = create(:company, company_name:'Hp')
      job = create(:job)

      visit root_path

      click_on 'Cadastrar Vaga'

      fill_in 'Título',             with: job.title
      fill_in 'Descrição',          with: job.description
      select company.company_name,  from: 'Empresa'
      fill_in 'Categoria da vaga',  with: job.job_category
      fill_in 'Local',              with: job.location

      click_on 'Salvar vaga'

      expect(page).to have_css('h2', text: job.title)
      expect(page).to have_content(job.location)
      expect(page).to have_content(company.company_name)
    end
    scenario 'field validation' do

      visit new_job_path

      click_on 'Salvar vaga'

      expect(page).to have_text('Preéncha os campos obrigatórios')
      expect(page).to have_text('*Campo obrigatório')
      expect(page).to have_text('*Campo obrigatório')
      expect(page).to have_text('*Campo obrigatório')
      expect(page).to have_text('*Campo obrigatório')
      expect(page).to have_text('*Campo obrigatório')

    end
  end
