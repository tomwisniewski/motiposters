# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    name "John Smith"
    email "john@example.com"
    street "City Rd"
    postcode "NW1 34Q"
    city "London"    
    product 
  end
end
