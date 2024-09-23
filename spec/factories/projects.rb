FactoryBot.define do
  factory :project do
    name { FFaker::AddressUK.street_address }
    status { 'not_started' }
  end
end
