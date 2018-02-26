FactoryBot.define do
  factory :read_Ready_Player_One_book, class: 'Goal' do
    name 'Ready Player One'
    frequency 'daily'
    goal_value 385
  end

  factory :attend_bodypump, class: 'Goal' do
    name 'go to bodypump class'
    frequency 'weekly'
    goal_value 3
    new_entry_add_to_total true
  end
end