class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def soft_delete
    update(deleted_at: Time.current)
  end
end
