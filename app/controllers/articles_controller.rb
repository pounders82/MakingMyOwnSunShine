class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy] #can do this if there is a repeative call
  before_action :require_user, only: [:edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new
  end

  def edit

  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = "Article was successfully created" #:success gives a green background to the message
      redirect_to article_path(@article)
    else
      render 'new'
    end
    end

  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    # @article.save
    @article.user = current_user
    if @article.save
    flash[:success] = "Article was successfully created"
    redirect_to article_path(@article)
    else
    render 'new'

    end
  end
  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:danger]= "Article was successfully deleted" #:danger gives a red background to the delete message
    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end

    def set_article
      @article = Article.find(params[:id])
    end

    def require_same_user
      if current_user != @article.user
        flash[:daneger] = "You can only edit your own article"
        redirect_to root_path
      end
    end

  end