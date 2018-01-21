class Category < ApplicationRecord
  belongs_to :user
  has_many :goals, dependent: :destroy
  enum unit_type: {
      boolean: 0,
      number: 1,
      percent: 2
  }
end
