# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do  

  factory :product do   
    title "May the force be with you"    
    price 1000    
    avatar File.new(Rails.root + 'spec/fixtures/test.png') 
  end
end
