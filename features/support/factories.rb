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

  factory :statistic do |stat|
    stat.allergies 'nincs'
    stat.diseases 'kohoges'
    stat.medicines 'kalmopyrin'
    stat.vitamins 'D vitamin'
    stat.hormon_treatment true
    stat.smoking false
    stat.litres_of_liquid_per_day 3
    stat.sun_protector false
    stat.main_problem 'szaraz'
    stat.problem_appeared '1 eve'
    stat.possible_reason_of_problem 'kenem'
    stat.visited_dermatologist "nem volt es nem jo volt"

  end

  factory :user do |user|
    user.username 'bob'
    user.salt 'secret'
    user.email 'bob@testmail.com'
    user.password '1'
    user.language 'en'
    user.admin 'false'
    user.auth_token 'er0889879iuhjjbll'
  end

  factory :examination do |exam|
    exam.anamnezis 'Nyavaja'
    exam.treatment 'treatment'
    exam.charge 15000
    exam.status 'brutal'
    exam.guest_id 1
  end

end