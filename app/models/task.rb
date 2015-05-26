class Task < ActiveRecord::Base
  has_many :comments
  belongs_to :list

  #You are setting an instance variable within a class method. This hurts
  #my brain
  def self.complete
    self.completed = true
  end

  def complete!
    self.completed = true
  end
end
