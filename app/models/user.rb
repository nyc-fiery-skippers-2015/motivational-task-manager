class User < ActiveRecord::Base
  has_many :lists
  has_many :tasks, through: :lists
  has_many :comments, foreign_key: 'author_id'
end
