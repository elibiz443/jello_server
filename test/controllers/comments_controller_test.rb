require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    skip "Not Yet Set"
    
    @comment = comments(:one)
  end

  test "should get index" do
    get comments_url, as: :json
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post comments_url, params: { comment: { body: @comment.body, card_id: @comment.card_id, creator_id: @comment.creator_id } }, as: :json
    end

    assert_response 201
  end

  test "should show comment" do
    get comment_url(@comment), as: :json
    assert_response :success
  end

  test "should update comment" do
    patch comment_url(@comment), params: { comment: { body: @comment.body, card_id: @comment.card_id, creator_id: @comment.creator_id } }, as: :json
    assert_response 200
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete comment_url(@comment), as: :json
    end

    assert_response 204
  end
end
