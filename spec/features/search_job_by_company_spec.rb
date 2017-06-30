require 'rails_helper'

  feature 'search job by company' do
    scenario 'successfully' do
      company = create(:company, company_name:'Hp')
      job = create(:job, company:company)

      visit root_path

      click_on 'Hp'

      expect(page).to have_css('h2', text:"Vagas para #{company.company_name}")
      expect(page).to have_content(job.title)
      expect(page).to have_content(job.location)
    end
    scenario 'acess job in company' do
      company = create(:company, company_name:'DELL')
      job = create(:job, title:"Design grafico",
                         company:company)

      visit company_path(company)

      click_on "Design grafico"

      expect(page).to have_css('h2', text:job.title)
      expect(page).to have_content(job.description)
      expect(page).to have_content(company.company_name)
      expect(page).to have_content(job.job_category)
      expect(page).to have_content(job.location)

    end
    scenario 'message of company without job' do
      company = create(:company, company_name:'Hp')

      visit root_path

      click_on 'Hp'

      expect(page).to have_text("Vagas para #{company.company_name}")
      expect(page).to have_css('h2', text: "Sem Vagas")
    end
  end
