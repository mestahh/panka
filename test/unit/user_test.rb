require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "user test" do
    @user = User.new
    @user.username = 'Todd'
    @user.password = '1'
    @user.email = 'todd@gmail.com'
    @user.save
    
    assert_equal User.count, 1
    puts @user.hashed_password
  end
end
