class User < ApplicationRecord
  has_many :categories, dependent: :destroy
  has_many :goals, through: :categories
end
