FactoryGirl.define do
  factory :fuel_station do
    name "UDR"
    street_address  "800 Acoma St"
    city 'Denver'
    state 'CO'
    fuel_types 'ELEC'
    distance '0.3142'
    access_time '24 hours daily'
  end
end
