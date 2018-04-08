class Goal < ApplicationRecord
  belongs_to :category
  has_many :ledgers
  enum frequency: {
      daily: 0,
      weekly: 1,
      monthly: 3,
      other: 4
  }

  validates :name, presence: true
  validates :frequency, presence: true

  def progress
    return nil if category.unit_type == 'boolean' || goal_value.nil?

    case frequency.to_sym
      when :daily
        total = ledgers.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).sum('value')
        return (total / goal_value) * 100
      when :weekly
        total = ledgers.where(created_at: Time.zone.now.beginning_of_week..Time.zone.now.end_of_day).sum('value')
      when :monthly
        total = ledgers.where(created_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_day).sum('value')
      when :other
        total = ledgers.sum('value')
    end

    total
  end

  def progress_percentage
    (progress / goal_value) * 100
  end

  def progress_unit
    case frequency.to_sym
      when :daily
        'today'
      when :weekly
        'this week'
      when :monthly
        'this month'
      when :other
        "till #{end_target}"
    end
  end
end
