class SessionsController < ApplicationController

    def new
        render :new
    end
    
    def create
        user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )

        if user && user.activated
            log_in_user(user)
        elsif user && !user.activated
            flash.now[:errors] = ["Activation required"]
            render :new
        else
            flash.now[:errors] = ["Username/Password didn't match"]
            render :new
        end
    end

    def destroy
        log_out_user
    end
end
