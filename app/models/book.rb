class Book < ApplicationRecord
  has_many :transactions, dependent: :delete_all
  has_many :reviews, dependent: :delete_all

  validates :name, presence: true
  validates :author, presence: true
  validates :publisher, presence: true
  validates :price, presence: true, numericality: {greater_than: 0}
  validates :stock, presence: true, numericality: {greater_than: -1, only_integer: true}

  def self.by_author(author)
    where(author: author)
  end
end
