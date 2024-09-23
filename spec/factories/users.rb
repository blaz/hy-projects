FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { 'password123' }
    password_confirmation { 'password123' }

    factory :solicitor do
      role { 'solicitor' }
    end

    factory :agent do
      role  { 'agent' }
    end

    factory :client do
      role { 'client' }
    end
  end
end
