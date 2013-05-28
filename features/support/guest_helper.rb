def fill_in_new_guest
  fill_in 'guest_name', :with => 'Kovacs Janos'
  fill_in 'guest_birth', :with => '1956.03.25'
  fill_in 'guest_mother', :with => 'Szabo Anna'
  fill_in 'guest_address', :with => 'Hallo utca 20.'
  fill_in 'guest_city', :with => 'Tata'
  fill_in 'guest_postal_code', :with => '2890'
  fill_in 'guest_phone', :with => '06305554534'
  fill_in 'guest_email', :with => 'k.j@email.com'
end