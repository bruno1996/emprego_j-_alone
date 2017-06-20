class Job < ApplicationRecord

  belongs_to :company

  validates :title,:description,:company,:job_category,:location, presence: true

end
