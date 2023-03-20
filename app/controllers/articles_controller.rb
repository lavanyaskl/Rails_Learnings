class ArticlesController < ApplicationController
  before_action :authoized_article?, only: %i[show edit update]

  def index
    if session[:user_id].present?
      @user = User.find_by(id: session[:user_id])
      if @user
        @articles = @user.articles
      end
    else
      flash[:error] = 'Please login'
      redirect_to login_path
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params.permit(:title, :body))
    @article.user = User.find_by(id: session[:user_id])
    if @article.save
      redirect_to articles_path
    else
      flash.now[:error] = 'Please login'
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    article.title = params[:title]
    article.body = params[:body]
    article.save
    flash[:notice] = 'Article Successfully updated!'
    redirect_to action: :show, id: params[:id]
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    flash[:notice] = 'Article Successfully destroyed!'
    redirect_to articles_path
  end

  private

  def authoized_article?
    unless session[:user_id] == Article.find_by(id: params[:id])&.user_id
      flash[:error] = 'Not authrorized'
      redirect_to articles_path
    end
  end
end