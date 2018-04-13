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
    return nil if goal_value.nil?

    case frequency.to_sym
    when :daily
      total = daily_ledger_value
    when :weekly
      total = weekly_ledger_value
    when :monthly
      total = monthly_ledger_value
    when :other
      total = target_date_ledger_value
    end

    total
  end

  def progress_percentage
    (Float(progress) / goal_value) * 100
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

  private

  def daily_ledger_value
    # We don't care about new_entry_add_to_total for a daily goal
    # We sum all entered values for a day
    ledgers.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).sum('value')
  rescue
    nil
  end

  def weekly_ledger_value
    if new_entry_add_to_total? || category.unit_type == 'boolean'
      ledgers
          .where(created_at: Time.zone.now.beginning_of_week..Time.zone.now.end_of_day)
          .sum('value')
    else
      ledgers
          .where(created_at: Time.zone.now.beginning_of_week..Time.zone.now.end_of_day)
          .order('created_at DESC').limit(1)[0]['value']
    end
  rescue
    nil
  end

  def monthly_ledger_value
    if new_entry_add_to_total? || category.unit_type == 'boolean'
      ledgers
          .where(created_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_day)
          .sum('value')
    else
      ledgers
          .where(created_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_day)
          .limit(1)[0]['value']
    end
  rescue
    nil
  end

  def target_date_ledger_value
    if new_entry_add_to_total?
      ledgers.sum('value')
    else
      ledgers.order('created_at DESC').limit(1)[0]['value']
    end
  end
end
