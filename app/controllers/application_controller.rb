class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :logged_as_admin?

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !current_user.nil?
    end

    def logged_as_admin?
        logged_in? && current_user.admin?
    end

    def require_user
        if !logged_in?
            flash[:alert] = 'You must be logged for this action'
            redirect_to login_path
        end
    end
end
