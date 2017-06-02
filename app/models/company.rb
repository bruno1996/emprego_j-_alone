class Company < ApplicationRecord

validates :company_name,:location,:email,:phone, presence:true
end
