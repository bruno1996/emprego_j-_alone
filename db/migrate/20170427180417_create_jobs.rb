class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :description
      t.string :company_name
      t.string :job_category
      t.string :location

      t.timestamps
    end
  end
end
