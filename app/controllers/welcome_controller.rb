class WelcomeController < ApplicationController

    def index
        @infos = Info.all.order(created_at: :desc)
        @animations = Animation.all.order(date: :asc)
        if is_logged_in
            @your_animation_participation = current_logged_user.animation_participants
        end
    end
end
