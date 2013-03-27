require 'factory_girl'

FactoryGirl.define do
  
  factory :guest do |guest|
    guest.name 'Bob'
	guest.birth '1952.04.12.'
	guest.mother 'Szabo Klari'
	guest.address 'Hullam utca 20.'
	guest.city 'Tata'
	guest.postal_code '1890'
	guest.phone '06301234567'
	guest.email 'bob@gmail.com'
  end
  
end