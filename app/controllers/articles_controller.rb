class ArticlesController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def create
    @article = Article.new(artcile_params)
    @artcile.save
    redirect_to article_path(@article)
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def update
    @article.update(article_params)
    @article.save
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:article).permit(:title, :content)
  end
  def set_restaurant
    @article = Article.find(params[:id])
  end

end
