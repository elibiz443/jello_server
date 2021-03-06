require 'test_helper'

class CardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    skip "Not Yet Set"
    
    @card = cards(:one)
  end

  test "should get index" do
    get cards_url, as: :json
    assert_response :success
  end

  test "should create card" do
    assert_difference('Card.count') do
      post cards_url, params: { card: { archived: @card.archived, assignee_id: @card.assignee_id, creator_id: @card.creator_id, description: @card.description, list_id: @card.list_id, title: @card.title } }, as: :json
    end

    assert_response 201
  end

  test "should show card" do
    get card_url(@card), as: :json
    assert_response :success
  end

  test "should update card" do
    patch card_url(@card), params: { card: { archived: @card.archived, assignee_id: @card.assignee_id, creator_id: @card.creator_id, description: @card.description, list_id: @card.list_id, title: @card.title } }, as: :json
    assert_response 200
  end

  test "should destroy card" do
    assert_difference('Card.count', -1) do
      delete card_url(@card), as: :json
    end

    assert_response 204
  end
end
