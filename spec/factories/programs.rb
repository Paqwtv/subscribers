FactoryBot.define do
  factory :program do
    title { FFaker::Book.title }
    description { FFaker::Book.description }
    trait :with_subscribers do
      after :create do |program|
        create_list :user, 3, programs: program   # has_many
      end
    end
  end
end
