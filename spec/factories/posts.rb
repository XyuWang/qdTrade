# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    association :user, factory: :user
    association :school, factory: :school
    association :category, factory: :category
    title "title"
    content "content"
    price "9.99"
    contact "12222222222"
    public true
  end
end
