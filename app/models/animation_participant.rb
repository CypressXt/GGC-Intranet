class AnimationParticipant < ActiveRecord::Base
    belongs_to :user
    belongs_to :animation
end
