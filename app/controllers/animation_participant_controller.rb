class AnimationParticipantController < ApplicationController
    before_action :must_be_logged

    def new
        @current_animation = Animation.find_by(id: params["animation_id"])
        @animation_participant = AnimationParticipant.new
        if !@current_animation
            render_404
        end
    end

    def create
        current_animation =  Animation.find_by(id: params["animation_id"])
        @animation_participant = AnimationParticipant.first_or_create(animation: current_animation,user: current_logged_user)
        @animation_participant.team_name = params["animation_participant"]["team_name"]
        if @animation_participant.save
            flash[:success] = "Nice, you joined the "+current_animation.name+" animation successfully !"
        else
            flash[:danger] = "Failed during the joining process for the "+current_animation.name+" animation."
        end
        redirect_to animation_path(current_animation.id)
    end

    def delete
        @current_animation = Animation.find_by(id: params["animation_id"])
        if @current_animation
            @animation_participant = AnimationParticipant.find_by(user: current_logged_user, animation: @current_animation)
        else
            render_404
        end
    end

    def destroy
        @current_animation = Animation.find_by(id: params["animation_id"])
        if @current_animation
            @animation_participant = AnimationParticipant.find_by(user: current_logged_user, animation: @current_animation)
            if @animation_participant.destroy
                flash[:success] = "Nice, you leaved the "+@current_animation.name+" animation successfully !"
                redirect_to animation_path(@current_animation.id)
            else
                flash[:danger] = "Failed during the leaving process for the "+@current_animation.name+" animation."
                redirect_to animation_path(@current_animation.id)
            end
        else
            render_404
        end
    end

    def participant_parms
        params.require(:animation_participant).permit(:team_name)
    end


end
