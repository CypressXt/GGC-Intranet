class UserController < ApplicationController
    def show
        @user = User.find_by(id: params["id"])
        if !@user
            render_404
        end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        passwd = rand(36**12).to_s(36)
        @user.change_password(passwd)
        if @user.save
            flash.now[:success] = @user.name + " created successfully !"
            render 'new'
        else
            flash.now[:danger] =  "Failed to create "+@user.name + ", check every fields."
            render 'new'
        end
    end

    def user_params
        params.require(:user).permit(:name, :lastname, :email, :nickname)
    end

end
