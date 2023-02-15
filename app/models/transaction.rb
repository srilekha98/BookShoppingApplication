class Transaction < ApplicationRecord
  belongs_to :book
  belongs_to :user
  validates :credit_card_number, presence: true, length: {is: 16}, numericality: { only_numeric: true }
  validates :address, presence: true
  validates :phone_number, presence: true, length: {is: 10}, numericality: { only_numeric: true }
  validates :quantity, presence: true
  validates :total_price, presence: true
end
