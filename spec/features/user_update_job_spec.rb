require 'rails_helper'

  feature 'user update job' do
    scenario 'successfully' do
      company1 = create(:company, company_name:'Hp')
      company2 = create(:company, company_name:'DELL')
      job = create(:job, company:company1)

      visit root_path

      click_on 'Dev'

      click_on 'Atualizar Vaga'

      fill_in 'Título',             with: job.title
      fill_in 'Descrição',          with: job.description
      select company2.company_name,  from: 'Empresa'
      fill_in 'Categoria da vaga',  with: 'Sénior'
      fill_in 'Local',              with: job.location

      click_on 'Atualizar'

      expect(page).to have_css('h2', text:job.title)
      expect(page).to have_content(job.description)
      expect(page).to have_content(company2.company_name)
      expect(page).to have_content('Sénior')
      expect(page).to have_content(job.location)
    end
    scenario 'valid of field of update' do
      company = create(:company, company_name:'Hp')
      job = create(:job)

      visit root_path

      click_on 'Dev'

      click_on 'Atualizar Vaga'

      fill_in 'Título',             with: job.title
      fill_in 'Descrição',          with: job.description
      select company.company_name,  from: 'Empresa'
      fill_in 'Categoria da vaga',  with: ''
      fill_in 'Local',              with: job.location

      click_on 'Atualizar'

      expect(page).to have_content('Preéncha os campos obrigatórios')
      expect(page).to have_content('Campo obrigatório')
    end
  end
