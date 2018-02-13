class Category < ApplicationRecord
  belongs_to :user
  has_many :goals, dependent: :destroy
  enum unit_type: {
      boolean: 0,
      number: 1,
      percent: 2
  }

  validates :name, presence: true
  validates :unit_type, presence: true

  def created_at_formatted
    created_at.to_time.strftime('%B %e at %l:%M %p')
  end

  def updated_at_formatted
    created_at.to_time.strftime('%B %e at %l:%M %p')
  end
end
