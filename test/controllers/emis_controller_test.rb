require "test_helper"

class EmisControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get emis_index_url
    assert_response :success
  end
end
