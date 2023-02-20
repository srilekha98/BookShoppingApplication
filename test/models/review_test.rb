require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  test "fixture setup" do
    assert Review.all.count == 2
  end
end
