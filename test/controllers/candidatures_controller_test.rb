require 'test_helper'

class CandidaturesControllerTest < ActionDispatch::IntegrationTest
  test "should get apply_to_position" do
    get candidatures_apply_to_position_url
    assert_response :success
  end

end
