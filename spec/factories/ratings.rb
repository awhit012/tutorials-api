FactoryGirl.define do
  factory :rating do
    value { rand(1..5) }
    tutorial
  end
end