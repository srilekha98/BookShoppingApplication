class User < ApplicationRecord
  has_secure_password
  has_many :reviews, dependent: :destroy
  has_many :transactions
  has_many :books
  validates :username, presence: true, uniqueness: true
  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" }
end
