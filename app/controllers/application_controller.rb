class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    def current_user
    end

    def logged_in?
    end

    def log_in_user(user)
    end

    def require_login
    end

    def log_out_user
    end
end
