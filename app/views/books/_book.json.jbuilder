json.extract! book, :id, :name, :author, :publisher, :price, :stock, :created_at, :updated_at, :average_rating
json.url book_url(book, format: :json)
