module SessionHelper
    def log_in_session(user)
        session[:UserLoggedId] = user.id
    end

    def current_logged_user
        user = User.find_by(id: session[:UserLoggedId])
    end

    def is_logged_in
        !session[:UserLoggedId].nil?
    end

    def log_out
        session.delete(:UserLoggedId)
    end

    def is_proprietary
        id_to_check = 0
        if (params[:user_id])
            id_to_check = params[:user_id].to_i
        else
            id_to_check = params[:id].to_i
        end
        if current_logged_user != nil
            if (current_logged_user.id == id_to_check)
                return true
            end
        end
        return false
    end

    def is_admin
        if current_logged_user != nil && current_logged_user.admin
            return true
        else
            render_403
            return false
        end
    end

    def must_be_proprietary
        if !is_proprietary
            render_403
        end
    end

    def must_be_logged
        if !is_logged_in
            render_403
        end
    end
end
