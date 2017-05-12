class Job < ApplicationRecord

validates :title,:description,:company_name,:job_category,:location, presence: true

end
