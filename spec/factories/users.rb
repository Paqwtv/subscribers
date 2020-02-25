FactoryBot.define do
  factory :user do
    name { FFaker::NameCN.name }
    email { FFaker::Internet.email }
    password { SecureRandom.uuid }
  end
end
