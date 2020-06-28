class UsersController < ApplicationController

    def new
        render :new
    end

    def create
        user = User.new(user_params)

        UserMailer.welcome_email(user).deliver_now!

        redirect_to root_url

        # if user.save 
        #     log_in_user(user)
        # else
        #     flash.now[:errors] = user.errors.full_messages
        #     render :new
        # end
    end

    def activate
        @user = User.find_by(activation_token: params[:activation_token])
        @user.activate!
        log_in_user(@user)
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
