class Animation < ActiveRecord::Base
    belongs_to :user
    has_many :animation_participants
    validates :name, :nb_participants, :description, :date, presence: true
end
