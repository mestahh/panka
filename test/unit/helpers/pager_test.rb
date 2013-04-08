require 'test_helper'

class PagerTest < ActionView::TestCase
  def setup
    @pager = Pager.new
    @pager.elements_per_page = 5
    @elements = [1,2,3,4,5,6,7]
  end

  test "returns first page" do
    result = @pager.get_page(@elements, 1)
    assert_equal [1,2,3,4,5], result
  end

  test "returns second page" do
    result = @pager.get_page(@elements, 2)
    assert_equal [6,7], result
  end

  test "page is null returns all elements" do
    result = @pager.get_page(@elements, nil)
    assert_equal @elements, result
  end

  test "pager knows the number of pages" do
    number_of_pages = @pager.number_of_pages(@elements)
    assert_equal 2, number_of_pages
  end
end
