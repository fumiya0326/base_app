require 'test_helper'

class SulesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sules_index_path
    assert_response :success
  end

end
