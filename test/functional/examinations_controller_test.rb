require 'test_helper'

class ExaminationsControllerTest < ActionController::TestCase
  
  test "index action returns index page with all examinations" do
    @request.session[:user] = 1
    get :index
    assert_response :success
  end

end
