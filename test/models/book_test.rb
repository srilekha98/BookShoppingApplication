require "test_helper"

class BookTest < ActiveSupport::TestCase
  test "valid input check" do
    book = Book.new(:name => "name of book",
                    :author => "author",
                    :publisher => "publisher",
                    :price => 30,
                    :stock => 10)
    assert_equal(book.name, 'name of book')
    assert_equal(book.author,'author')
    assert_equal(book.publisher,'publisher')
    assert_operator book.price, :>=, 0
    assert_operator book.stock, :>, 0
  end
end
