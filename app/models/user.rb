class User < ActiveRecord::Base
  has_many :lists, foreign_key: 'author_id'
  has_many :tasks, through: :lists
  has_many :comments, foreign_key: 'author_id'
end
