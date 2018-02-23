class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def created_at_formatted
    created_at.to_time.strftime('%B %e at %l:%M %p')
  end

  def updated_at_formatted
    updated_at.to_time.strftime('%B %e at %l:%M %p')
  end
end
