# frozen_string_literal: true

class ArticlesController < ApplicationController
  # puede usarse para llamar las acciones repetitivas al iniciar
  # puede hacerse con only para definir cuales, o con except para quitar
  before_action :find_article, except: %i[new create index from_author]
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  # existe after_action para despues de ejecutar el codigo.

  def index
    @articles = Article.all
  end

  def show; end

  def edit
    @categories = Category.all
  end

  def new
    @article = Article.new
    @categories = Category.all
  end

  def update
    @article.update(article_params)
    @article.save_categories
    redirect_to @article
  end

  def create
    @article = current_user.articles.create(article_params)
    @categories = Category.all
    @article.save_categories
    redirect_to @article
  end

  # def create
  #   @article = Article.create(title: params[:article][:title],
  #                             content: params[:article][:content],
  #                             user: current_user)
  #   render json: @article
  # end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  def from_author
    @user = User.find(params[:user_id])
  end

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, category_elements: [])
  end
end
