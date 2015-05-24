class List < ActiveRecord::Base
  has_many :tasks
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, through: :tasks

  def self.custom_url
    random = [('a'..'z'), ('0'..'9'), ('A'..'Z')].map { |i| i.to_a }.flatten
    string = (0..8).map { random[rand(random.length)] }.join
  end
  #need to make a destroy method for when a list's created by date goes past 24 hours

  def self.self_destruct(list)
    (Time.now.hour - list.created_at.hour).abs > 24 ? list.destroy : true
  end
end
