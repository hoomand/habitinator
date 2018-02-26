FactoryBot.define do
  factory :category_book, :class => 'Category' do
    name 'books'
    unit_type 'number'
    unit_name 'page'
  end

  factory :category_gym, class: 'Category' do
    name 'gym'
    unit_type 'boolean'
    unit_name 'session'
  end
end