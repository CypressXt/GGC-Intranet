class CreateAnimationParticipants < ActiveRecord::Migration
    def change
        create_table :animation_participants do |t|
            t.string :team_name
            t.belongs_to :user, index: true
            t.belongs_to :animation, index: true
            t.timestamps null: false
        end
    end
end
