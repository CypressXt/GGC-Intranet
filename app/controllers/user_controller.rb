class UserController < ApplicationController
    def show
        @user = User.find_by(id: params["id"])
        if !@user
            render_404
        end
    end


end
