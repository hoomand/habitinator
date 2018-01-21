class Goal < ApplicationRecord
  belongs_to :category
  has_many :ledgers
  enum frequency: {
      daily: 0,
      weekly: 1,
      bi_weekly: 2,
      monthly:3,
      yearly: 4
  }
end
