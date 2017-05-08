require 'rails_helper'

  feature 'user register job' do
    scenario 'successfully' do

      job = Job.new(title:'Desenvolvedor',
                    description:'Programar em ruby',
                    company_name:'Google',
                    job_category:'Seniôr',
                    location:'São Paulo')

      visit root_path

      click_on 'Cadastrar Vaga'

      fill_in 'Título',             with: job.title
      fill_in 'Descrição',          with: job.description
      fill_in 'Nome da empresa',    with: job.company_name
      fill_in 'Categoria da vaga',  with: job.job_category
      fill_in 'Local',              with: job.location

      click_on 'Salvar vaga'

      expect(page).to have_css('h2', text: job.title)
      expect(page).to have_content(job.description)
      expect(page).to have_content(job.company_name)
      expect(page).to have_content(job.job_category)
      expect(page).to have_content(job.location)
    end
    scenario 'field validation' do

      visit new_job_path

      click_on 'Salvar vaga'

      expect(page).to have_text('Preéncha os campos obrigatórios')
    end
  end
