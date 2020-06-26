class SessionsController < ApplicationController

    def new
        render :new
    end
    
    def create
        user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )

        if user
            
        else
            flash[:errors] = ["Username/Password didn't match"]
            render :new
        end
    end

    def destroy
    end
end
