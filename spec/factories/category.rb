FactoryBot.define do
  factory :category_book, :class => 'Category' do
    name 'books'
    unit_type 'number'
    unit_name 'page'
  end
end