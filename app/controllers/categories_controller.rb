class CategoriesController < ApplicationController

    def index
    end

    def show
        @category = Category.find(params[:id])
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)

        if @category.save
            flash[:notice] = 'Category was created successfully!'
            redirect_to @category
        else
            flash[:errors] = @category.errors.full_messages
            redirect_to new_category_path
        end
    end

    def edit
    end

    private 

    def category_params
        params.require(:category).permit(:name)
    end
end