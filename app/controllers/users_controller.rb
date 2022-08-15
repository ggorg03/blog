class UsersController < ApplicationController
    def new
        @user = User.new
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

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
