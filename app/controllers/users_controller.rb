class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :require_user, only: [:edit, :update, :destroy]
    before_action :require_same_user, only: [:edit, :update]
    before_action :require_same_user_or_admin, only: [:destroy]

    def show
        @articles = @user.articles.paginate(page: params[:page], per_page: 5).order('updated_at DESC')
    end

    def index
        @users = User.paginate(page: params[:page], per_page: 5).order('updated_at DESC')
    end

    def new
        @user = User.new
    end

    def edit
    end


    def create
        @user = User.new(user_params)        
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] =  "Welcome to Alpha Blog, #{@user.username}"
            redirect_to users_path(@user)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to signup_path
       end
    end

    def update
        if @user.update(user_params)
            flash[:notice] = "User was successfully updated"
            redirect_to user_path(@user)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to edit_user_path(@user)
        end
    end

    def destroy
        if current_user.admin? || @user.authenticate(params[:confirmation][:password])
            @user.destroy
            session[:user_id] = nil unless current_user.admin?
            flash[:notice] = "Profile and all associated articles were successfully deleted!"
            redirect_to root_path
        else
            flash[:alert] = "Profile was not deleted!"
            redirect_to @user
        end
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def require_same_user
        if @user != current_user 
            flash[:alert] = 'You just can edit your Profile'
            redirect_to @user
        end
    end

    def require_same_user_or_admin
        byebug
        if @user != current_user && !current_user.admin?
            flash[:alert] = 'You just can delete your Profile'
            redirect_to @user
        end
    end
end
