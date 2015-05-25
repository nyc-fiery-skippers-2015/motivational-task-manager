class Task < ActiveRecord::Base
  has_many :comments
  belongs_to :list

  def self.complete
    self.completed = true
  end
end
