class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :location
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end