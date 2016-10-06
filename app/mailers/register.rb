class Register < ApplicationMailer
    default from: Rails.application.secrets.mail_user

    def welcome(user, password)
        @user = user
        @password = password
        mail(to: @user.email, subject: 'Welcome @GGC 2016 !')
    end
end
