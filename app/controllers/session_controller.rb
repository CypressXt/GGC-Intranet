class SessionController < ApplicationController
    def new
        if !is_logged_in
            render 'new'
        else
            redirect_to user_path(current_logged_user.id)
        end
    end

    def create
        user = User.find_by(mail: params[:session][:mail].downcase)
        if user && user.authenticate(params[:session][:password])
            log_in_session(user)
            redirect_to user_path(user.id)
        else
            flash.now[:danger] = 'Invalid mail and password combination'
            render 'login'
        end
    end

    def destroy
        log_out
        redirect_to root_url
    end
end
