require 'rails_helper'

  feature 'register company' do
    scenario 'successfully' do

      job = create(:job)

      company = create(:company)

      visit root_path

      click_on 'Cadastrar Empresa'

      fill_in 'Nome da Empresa',    with: company.company_name
      fill_in 'Localização',        with: company.location
      fill_in 'Email de Contato',   with: company.email
      fill_in 'Telefone de Contato',with: company.phone

      click_on 'Salvar empresa'

      expect(page).to have_content(company.company_name)
    end
    scenario 'valid field of company' do

      visit new_company_path

      click_on 'Salvar empresa'

      expect(page).to have_text('Preéncha os campos obrigatórios')
      expect(page).to have_text('*Campo obrigatório')
      expect(page).to have_text('*Campo obrigatório')
      expect(page).to have_text('*Campo obrigatório')
      expect(page).to have_text('*Campo obrigatório')
    end
  end
