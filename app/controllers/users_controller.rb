class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]

    def show
        @articles = @user.articles
    end

    def index
        @users = User.all
    end
    
    def new
        @user = User.new
    end

    def edit
    end

    def update
        if @user.update(user_params)
            flash[:notice] = "User was successfully updated"
            redirect_to root_path
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to edit_user_path(@user)
        end
    end

    def create
        @user = User.new(user_params)        
        if @user.save
            flash[:notice] =  "Welcome to Alpha Blog, #{@user.username}"
            redirect_to articles_path;
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to signup_path user_params
       end
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
