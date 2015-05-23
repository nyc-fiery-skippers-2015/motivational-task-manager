class List < ActiveRecord::Base
  has_many :tasks
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, through: :tasks

  def self.custom_url
    random = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
    string = (0...50).map { random[rand(random.length)] }.join
  end
  #need to make a destroy method for when a list's created by date goes past 24 hours
  #need to make a unique url method for non-users to see the list and make comments

end
