FactoryBot.define do
  factory :read_Ready_Player_One_book, class: 'Goal' do
    name 'Ready Player One'
    frequency 'daily'
    goal_value 385
  end

  factory :attend_body_pump, class: 'Goal' do
    name 'go to BodyPump class'
    frequency 'weekly'
    goal_value 3
    new_entry_add_to_total true
  end
end