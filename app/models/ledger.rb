class Ledger < ApplicationRecord
  belongs_to :goal

  def start_time
    created_at.strftime('%Y-%m-%d').to_s
  end
end
