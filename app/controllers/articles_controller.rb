require 'byebug'
class ArticlesController < ApplicationController


    def index
        @articles = Article.all
    end


    def new

    end

    def create
        article = Article.new(params.permit(:title, :body))
        article.save
        redirect_to articles_path
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

    end
end