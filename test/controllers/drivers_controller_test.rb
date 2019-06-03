require 'test_helper'

class DriversControllerTest < ActionDispatch::IntegrationTest
  def authenticated_header
    token = Knock::AuthToken.new(payload: { sub: drivers(:one).id }).token

    {
      'Authorization': "Bearer #{eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTk0NDAxMTcsInN1YiI6Mn0.C7sjNagHr1SgWnrJw_SSH9MQvhUxSDrtXhp5A0m5cYM}"
    }
  end

  it 'responds successfully' do
    get secured_resources_url, headers: authenticated_header

    assert_response :success
  end
end
