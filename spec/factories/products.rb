# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do  	
	title "May the force be with you"
	image "/public/star_wars.jpg"
	price 1000  	
  end
end
