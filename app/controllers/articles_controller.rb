class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    render :index
  end

  def show
    @article = Article.find(params[:id])
    render :show
  end

  def new
    @article = Article.new
    render :new
  end

  def create
    @article = Article.new
    @article.title = params[:title]
    @article.description = params[:description]
    @article.save
    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:id])
    render :edit
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end
