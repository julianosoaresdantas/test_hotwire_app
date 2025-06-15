# app/controllers/articles_controller.rb

class ArticlesController < ApplicationController
  # This line ensures @article is set for show, edit, update, and destroy actions.
  # It calls the private `set_article` method before these actions.
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles
  # Renders the index view, displaying all articles.
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # Renders the show view for a specific article.
  # @article is already set by the `before_action`.
  def show
    # No additional code needed here if set_article is working.
  end

  # GET /articles/new
  # Initializes a new Article object for the creation form.
  def new
    @article = Article.new
  end

  # POST /articles
  # Creates a new article based on form parameters.
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article, notice: "Article was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /articles/1/edit
  # Renders the edit form for a specific article.
  # This action is also used by Turbo Frames for inline editing of the title.
  def edit
    # @article is already set by the `before_action`.
    # For Turbo Frame requests, we render just the partial for the title edit.
    # If it's a regular page request, the full edit.html.erb would be rendered by default.
    # (Although in our Turbo Frame setup, we specifically render partial in this action.)
    render partial: "articles/edit_title_form", locals: { article: @article }
  end

  # PATCH/PUT /articles/1
  # Updates an existing article based on form parameters.
  def update
    # @article is already set by the `before_action`.
    if @article.update(article_params)
      # If the update is successful, we use Turbo Streams to replace the
      # content of the `turbo_frame_tag` on the show page.
      render turbo_stream: turbo_stream.replace("article_#{@article.id}_title", partial: "articles/title", locals: { article: @article })
    else
      # If the update fails (e.g., validation errors), we re-render the form
      # within the same Turbo Frame so the user sees the errors.
      render partial: "articles/edit_title_form", locals: { article: @article }, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  # Deletes a specific article.
  def destroy
    @article.destroy
    redirect_to articles_url, notice: "Article was successfully destroyed."
  end

  private
    # `set_article` is a private method called by `before_action` to
    # find and assign the Article object to `@article` based on the `id` parameter.
    def set_article
      @article = Article.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      # Optional: Handle case where article is not found, e.g., redirect to index
      redirect_to articles_path, alert: "Article not found."
    end

    # `article_params` defines the strong parameters for Article.
    # It permits only `:title` and `:body` to be mass-assigned from forms,
    # preventing malicious parameter injection.
    def article_params
      params.require(:article).permit(:title, :body) # Ensure :body is permitted
    end
end
