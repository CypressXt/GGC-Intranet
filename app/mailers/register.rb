class Register < ApplicationMailer
    default from: 'intranet@geneva-gaming-convention.com'

    def welcome(user, password)
        @user = user
        @password = password
        mail(to: @user.email, subject: 'Welcome @GGC 2016 !')
    end
end
