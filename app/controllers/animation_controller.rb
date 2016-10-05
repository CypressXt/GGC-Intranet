class AnimationController < ApplicationController
    before_action :is_admin, only: [:create, :new, :delete, :destroy ]

    def new
        @animation = Animation.new()
    end

    def create
        @animation = Animation.new(animation_params)
        @animation.user = current_logged_user
        if @animation.save
            flash[:success] = "Animation successfuly created."
        else
            flash[:danger] = "Animation creation failed. Check every fields plz."
        end
        redirect_to new_animation_path
    end

    def show
        @animation = Animation.find_by(id: params[:id])
        if @animation
            @participants = @animation.animation_participants.order(created_at: :asc)
            render 'show'
        else
            render_404
        end
    end

    def delete
        @animation = Animation.find_by(id: params[:animation_id])
        if @animation
            render 'delete'
        else
            render_404
        end
    end

    def destroy
        @animation = Animation.find_by(id: params[:id])
        if @animation.destroy
            redirect_to root_path
        else
            flash[:danger] = "Error while removing the animation."
            redirect_to animation_delete_path(@animation.id)
        end
    end

    def animation_params
        params.require(:animation).permit(:name, :description, :nb_participants, :iframe_url, :date, :time)
    end
end
