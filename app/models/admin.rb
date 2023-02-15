class Admin < ApplicationRecord
  has_secure_password
  validates :name, :email, presence: true
  validates :username, :password, presence: true, on: [new, create]
  validates :username, presence: true, uniqueness: {message: 'An account associated with %{value} already exists'}, on: [new, create]
end
