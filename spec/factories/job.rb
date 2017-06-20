FactoryGirl.define do
  factory :job do

    association :company

    title "Dev"
    description "Dev em ruby"
    job_category "Junior"
    location "SP"
  end
end
