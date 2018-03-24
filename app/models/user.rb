class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true, presence: true
  validates :username, length: { maximum: 15}
  validates :username, length: { minimum: 3}
end
