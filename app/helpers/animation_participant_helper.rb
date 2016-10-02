module AnimationParticipantHelper


    def is_participant
        animation = Animation.find_by(id: params["id"])
        if is_logged_in && animation && current_logged_user
            animation.animation_participants.each do |participant|
                if participant.user == current_logged_user
                    return true
                end
            end
        end
        return false
    end

end
