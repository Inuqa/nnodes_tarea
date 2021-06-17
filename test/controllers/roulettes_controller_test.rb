require "test_helper"

class RoulettesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get roulettes_index_url
    assert_response :success
  end
end
