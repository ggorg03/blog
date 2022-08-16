class ArticlesController < ApplicationController

    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def index
        @articles = Article.paginate(page: params[:page], per_page: 5).order('updated_at DESC')
    end
    
    def show
    end

    def new
        @article = Article.new
    end

    def edit
    end

    def create
        @article = Article.new(article_params)
        # BEGIN - Temporary solution
        @user = User.first
        @article.user = @user
        # END
        if @article.save
            flash[:notice] = 'Article was created successfully'
            redirect_to article_path(@article)
        else
            flash[:errors] = @article.errors.full_messages
            render new_article_path
        end
    end

    def update
        if @article.update(article_params)
            flash[:notice] = 'Article was updated successfully'
            redirect_to article_path(@article)
        else
            flash[:errors] = @article.errors.full_messages
            redirect_to edit_article_path(@article)
        end
    end

    def destroy
        @article.destroy
        redirect_to articles_path
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end
end
