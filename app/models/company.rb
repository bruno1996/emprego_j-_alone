class Company < ApplicationRecord

  has_many :job

  validates :company_name,:location,:email,:phone, presence:true
end
