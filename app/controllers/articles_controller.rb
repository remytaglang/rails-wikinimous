require 'kramdown'

class ArticlesController < ApplicationController

  before_filter :authorize

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @markdown = Kramdown::Document.new(@article.content).to_html
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_path(@articles)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to articles_path(@articles)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :version)
  end

end
