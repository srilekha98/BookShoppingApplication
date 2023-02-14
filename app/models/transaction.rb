class Transaction < ApplicationRecord
  belongs_to :book
  belongs_to :user
  validates :credit_card_number, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :quantity, presence: true
  validates :total_price, presence: true
end
