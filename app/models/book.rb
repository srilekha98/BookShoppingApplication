class Book < ApplicationRecord
  has_many :transactions
  has_many :reviews
end
