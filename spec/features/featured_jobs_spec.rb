require 'rails_helper'

  feature 'featured jobs' do
    scenario 'successfully' do
      company = create(:company, company_name:'Hp')
      job = create(:job)

      visit new_job_path

      fill_in 'Título',             with: job.title
      fill_in 'Descrição',          with: job.description
      select company.company_name,  from: 'Empresa'
      fill_in 'Categoria da vaga',  with: job.job_category
      fill_in 'Local',              with: job.location
      check 'Destaque'

      click_on 'Salvar vaga'

      expect(page).to have_css('h3', text: 'Destaque')
      expect(page).to have_css('h2', text: job.title)
      expect(page).to have_content(job.location)
      expect(page).to have_content(company.company_name)

    end
    scenario 'validate featured' do
      company = create(:company, company_name:'Hp')
      job = create(:job)

      visit new_job_path

      fill_in 'Título',             with: job.title
      fill_in 'Descrição',          with: job.description
      select company.company_name,  from: 'Empresa'
      fill_in 'Categoria da vaga',  with: job.job_category
      fill_in 'Local',              with: job.location

      click_on 'Salvar vaga'

      expect(page).not_to have_css('h3', text: 'Destaque')
      expect(page).to have_css('h2', text: job.title)
      expect(page).to have_content(job.location)
      expect(page).to have_content(company.company_name)
    end
  end
