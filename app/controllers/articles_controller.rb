class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end
    
    def show
        @article = Article.find(params[:id])
    end

    def new
    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description))
        if @article.save
            flash[:notice] = 'Article was created successfully'
            redirect_to article_path(@article)
        else
            flash[:errors] = @article.errors.full_messages
            render new_article_path
        end
    end
end
