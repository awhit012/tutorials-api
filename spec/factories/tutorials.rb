FactoryGirl.define do
  factory :tutorial do
    title { Faker::Lorem.word }
    description { Faker::Lorem.paragraph}
    url { Faker::Internet.url }
  end
end