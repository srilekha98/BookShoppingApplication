class Book < ApplicationRecord
  has_many :transactions
  has_many :reviews

  def self.by_author(author)
    where(author: author)
  end
end
