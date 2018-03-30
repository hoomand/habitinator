class Ledger < ApplicationRecord
  belongs_to :goal

  def start_time
    "#{created_at.strftime('%Y-%m-%d')}"
  end
end
