class AnimationParticipantController < ApplicationController
    before_action :must_be_logged
    before_action :is_admin, only: [:kick]

    def new
        @current_animation = Animation.find_by(id: params["animation_id"])
        @animation_participant = AnimationParticipant.new
        if !@current_animation
            render_404
        end
    end

    def create
        current_animation =  Animation.find_by(id: params["animation_id"])
        if current_animation
            @animation_participant = AnimationParticipant.where(animation: current_animation).where(user: current_logged_user).first_or_create
            @animation_participant.team_name = params["animation_participant"]["team_name"]
            if AnimationParticipant.where(animation: current_animation).count < (current_animation.nb_participants + 10)
                if @animation_participant.save
                    flash[:success] = "Nice, you joined the "+current_animation.name+" animation successfully !"
                else
                    flash[:danger] = "Failed during the joining process for the "+current_animation.name+" animation."
                end
            else
                flash[:danger] = "Failed during the joining process for the "+current_animation.name+" animation. The animation is already full."
            end
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

    def kick
        @animation_participant = AnimationParticipant.find_by(id: params['participant_id'], animation_id: params['animation_id'])
        if @animation_participant
            @current_animation = @animation_participant.animation
            render 'kick'
        else
            render_404
        end
    end

    def kicked
        @animation_participant = AnimationParticipant.find_by(id: params['participant_id'], animation_id: params['animation_id'])
        if @animation_participant
            @current_animation = @animation_participant.animation
            if @animation_participant.destroy
                flash[:success] = @animation_participant.user.nickname.capitalize+" has been kicked."
            else
                flash[:danger] = "Failed to kick "+@animation_participant.user.nickname.capitalize
            end
            redirect_to animation_path(@current_animation.id)
        else
            render_404
        end
    end

    def participant_parms
        params.require(:animation_participant).permit(:team_name)
    end


end
