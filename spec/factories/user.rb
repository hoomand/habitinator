FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
end

FactoryGirl.define do
  factory :user, :class => 'User' do
    email
    first_name 'john'
    last_name 'doe'
    password '12345678'
    password_confirmation '12345678'
  end
end