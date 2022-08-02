class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end
    
    def show
        @article = Article.find(params[:id])
    end

    def new
    end

    def edit
        @article = Article.find(params[:id])
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

    def update
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title, :description))
            flash[:notice] = 'Article was updated successfully'
            redirect_to article_path(@article)
        else
            flash[:errors] = @article.errors.full_messages
            redirect_to edit_article_path(@article)
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end
end
