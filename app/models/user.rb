class User < ApplicationRecord
  has_secure_password
  has_many :reviews, dependent: :destroy
  has_many :transactions
  has_many :books
  validates :username, presence: true, uniqueness: {message: 'An account associated with username %{value} already exists'}
  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" }
  validates :password, presence: true, on: [new, create]
  validates :cc_num, :phone_num, numericality: { only_numeric: true }, length: {is: 16}
  validates :phone_num, length: {is: 10}
end
