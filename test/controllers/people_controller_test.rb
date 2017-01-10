require 'minitest/autorun'

class PeopleControllerTest < ActionDispatch::IntegrationTest

  test "Should get valid list of people" do
    get '/api/people'
    assert_response :success
    assert_equal response.content_type, 'application/json'
    # jdata = JSON.parse response.body
    # assert_equal 6, jdata['data'].length.to_i
    # assert_equal jdata['data'][0]['type'], 'people'
  end

=begin
  test "Should get valid people data" do
    person = People.find(69)
    get '/api/person/', params: {id: person.id}
    assert_response :success
    jdata = JSON.parse response.body
    assert_equal person.id.to_s, jdata['data']['id']
    assert_equal person.name, jdata['data']['attributes']['name']
    assert_equal person_url(person, {host: "localhost", port: 3000}),
                 jdata['data']['links']['self']
  end
=end

=begin
  test "Should get JSON:API error block when requesting person data with invalid ID" do
    get '/api/person', params: {id: "z"}
    assert_response 404
    jdata = JSON.parse response.body
    assert_equal "Wrong ID provided", jdata['errors'][0]['detail']
    assert_equal '/data/attributes/id', jdata['errors'][0]['source']['pointer']
  end
=end
end