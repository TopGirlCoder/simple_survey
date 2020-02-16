require 'test_helper'

class VotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    get '/users/sign_in'
    sign_in users(:two)
    post user_session_url
    @vote = votes(:one)
  end

  test "should get index" do
    get survey_votes_url(@vote.survey_id)
    assert_response :success
  end

  test "should get new" do
    get new_survey_vote_url(@vote.survey_id)
    assert_response :success
  end

  test "should create vote" do
    assert_difference('Vote.count') do
      post survey_votes_url(@vote.survey_id), params: { vote: { survey_id: @vote.survey_id, value: @vote.value } }
    end

    assert_redirected_to survey_vote_url(@vote.survey_id, Vote.last)
  end

  test "should show vote" do
    get survey_vote_url(@vote.survey_id, Vote.last)
    assert_response :success
  end

  test "should get edit" do
    get edit_survey_vote_url(@vote.survey_id, @vote)
    assert_response :success
  end

  test "should update vote" do
    patch survey_vote_url(@vote.survey_id, @vote), params: { vote: { survey_id: @vote.survey_id, value: @vote.value, voter_id: @vote.voter_id } }
    assert_redirected_to survey_vote_url(@vote)
  end

  test "should destroy vote" do
    assert_difference('Vote.count', -1) do
      delete survey_vote_url(@vote.survey_id, @vote)
    end

    assert_redirected_to surveys_url
  end
end
