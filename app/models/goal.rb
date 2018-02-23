class Goal < ApplicationRecord
  belongs_to :category
  has_many :ledgers
  enum frequency: {
      daily: 0,
      weekly: 1,
      monthly:3
  }
end
