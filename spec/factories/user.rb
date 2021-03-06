FactoryBot.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
end

FactoryBot.define do
  factory :user, class: 'User' do
    email
    first_name 'john'
    last_name 'doe'
    password '12345678'
    password_confirmation '12345678'
  end
  factory :user_jane, class: 'User' do
    email
    first_name 'jane'
    last_name 'doe'
    password '12345678'
    password_confirmation '12345678'
  end
  factory :user_admin, class: 'User' do
    email
    first_name 'admin'
    last_name 'doe'
    password '12345678'
    password_confirmation '12345678'
    role 'admin'
  end
end
