require 'rails_helper'

  feature 'acess page initialize' do

    scenario 'successfully' do

      visit root_path

      expect(page).to have_content("Emprego Já")
      expect(page).to have_content("Encontre seu emprego aqui")

    end

  end
