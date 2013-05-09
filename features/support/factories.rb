require 'factory_girl'

FactoryGirl.define do

  factory :comment do |comment|
    comment.content 'blabla'
    comment.commentable_id 1
    comment.commentable_type 'Examination'
  end

  factory :guest do |guest|
    guest.name 'Bob'
    guest.birth '1952.04.12.'
    guest.mother 'Szabo Klari'
    guest.address 'Hullam utca 20.'
    guest.city 'Tata'
    guest.postal_code '1890'
    guest.phone '06301234567'
    guest.email 'bob@gmail.com'
    guest.user_id 1
  end

  factory :user do |user|
    user.username 'bob'
    user.salt 'secret'
    user.email 'bob@gmail.com'
    user.password '1'
    user.language 'en'
  end

  factory :examination do |exam|
    exam.anamnezis 'Nyavaja'
    exam.treatment 'treatment'
    exam.charge 15000
    exam.status 'brutal'
    exam.guest_id 1
  end

end