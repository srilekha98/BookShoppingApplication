class Book < ApplicationRecord
  has_many :transactions
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :author, presence: true
  validates :publisher, presence: true
  validates :price, presence: true, numericality: {greater_than: 0}
  validates :stock, presence: true, numericality: {greater_than: 0, only_integer: true}

  def self.by_author(author)
    where(author: author)
  end
end
