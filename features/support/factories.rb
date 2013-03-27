require 'factory_girl'

FactoryGirl.define do
  
  factory :guest do |guest|
    guest.username 'Bob'
	guest.password 'pass'
  end
  
end