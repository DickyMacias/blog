# frozen_string_literal: true

class ArticlesController < ApplicationController
  # puede usarse para llamar las acciones repetitivas al iniciar
  # puede hacerse con only para definir cuales, o con except para quitar
  before_action :find_article, except: %i[new create]
  # existe after_action para despues de ejecutar el codigo.

  def show; end

  def edit; end

  def new
    @article = Article.new
  end

  def update
    @article.update(title: params[:article][:title], content: params[:article][:content])
    redirect_to @article
  end

  def create
    @article = Article.create(title: params[:article][:title], content: params[:article][:content])
    render json: @article
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
