class InfoController < ApplicationController
    before_action :is_admin


    def index
        @infos = Info.all
    end

    def new
        @info = Info.new
    end

    def create
        @info = Info.new(info_params)
        @info.user = current_logged_user
        if @info.save
            flash[:success] = "News successfuly created ."
        else
            flash[:danger] = "News creation failed."
        end
        redirect_to new_info_path
    end

    def info_params
        params.require(:info).permit(:title, :content)
    end

end
