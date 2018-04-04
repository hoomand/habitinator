FactoryBot.define do
  factory :ledger_day_1, class: 'Ledger' do
    value '50'
    created_at '2018-03-17'
  end
  factory :ledger_day_2, class: 'Ledger' do
    value '60'
    created_at '2018-03-20'
  end
  factory :ledger_day_3, class: 'Ledger' do
    value '90'
    created_at '2018-03-27'
  end
end