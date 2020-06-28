class UserMailer < ApplicationMailer

    def welcome_email(user)
        @user = user
        # @url = "/users/activate?activation_token=#{@user.activatioN_token}"
        @url = activate_users_url(activation_token: @user.activation_token)
        mail(to: user.email, subject: 'Welcome to Music App')
    end
end
