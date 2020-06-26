class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    def current_user
        @user ||= User.find_by(session_token: session[:session_token])
    end

    def logged_in?
        !!current_user
    end

    def log_in_user(user)
        session[:session_token] = user.reset_session_token!
        redirect_to root_url
    end

    def require_login
        if !logged_in?
            redirect_to new_session_url
        end
    end

    def log_out_user
        current_user.reset_session_token!
        session[:session_token] = nil
        redirect_to new_session_url
    end
end
