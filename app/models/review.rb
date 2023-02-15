class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :rating, presence: true , numericality: {greater_than: 0, only_integer: true, less_than:6}
  validates :review, presence: true
end
