require 'rails_helper'

  feature 'user view details job' do
    scenario 'successfully' do
      company = create(:company, company_name:'Hp')
      job = create(:job, title:'Técnico',
                         company:company)

      visit root_path

      click_on 'Técnico'

      expect(page).to have_css('h2', text:job.title)
      expect(page).to have_content(job.description)
      expect(page).to have_content(company.company_name)
      expect(page).to have_content(job.job_category)
      expect(page).to have_content(job.location)

    end
  end
