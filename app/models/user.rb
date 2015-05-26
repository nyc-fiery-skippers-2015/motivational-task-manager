class User < ActiveRecord::Base
  include BCrypt
  has_many :lists, foreign_key: 'author_id'
  has_many :tasks, through: :lists
  has_many :comments, foreign_key: 'author_id'
  validates :name, presence: true
  validates :email, presence: true
  validates :password_hash, presence: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    return [500, "Invaild User"] if new_password == ""
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(plaintext_password)
    self.password == plaintext_password
  end
end
