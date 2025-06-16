require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
  end

  test "should get index" do
    get articles_url
    assert_response :success
  end

  test "should get new" do
    get new_article_url
    assert_response :success
  end

  test "should create article" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { body: @article.body, title: @article.title } }
    end

    # This test expects a redirect after creation, which is standard Rails behavior.
    # If your create action is also using Turbo Streams, you would change this
    # to assert_response :ok and check for turbo_stream content.
    assert_redirected_to article_url(Article.last)
  end

  test "should show article" do
    get article_url(@article)
    assert_response :success
  end

  test "should get edit" do
    get edit_article_url(@article)
    assert_response :success
  end

  test "should update article" do
    patch article_url(@article), params: { article: { body: @article.body, title: @article.title } }
    # This assertion is changed for Hotwire/Turbo Streams, which sends a 200 OK
    # response with the turbo_stream content, instead of a 3xx redirect.
    assert_response :ok
  end

  test "should destroy article" do
    assert_difference("Article.count", -1) do
      delete article_url(@article)
    end

    # This test expects a redirect after destruction, which is standard Rails behavior.
    # If your destroy action is also using Turbo Streams, you would change this
    # to assert_response :see_other (for redirect-less Turbo frames) or :ok.
    assert_redirected_to articles_url
  end
end
