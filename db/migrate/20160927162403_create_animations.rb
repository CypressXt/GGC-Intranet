class CreateAnimations < ActiveRecord::Migration
    def change
        create_table :animations do |t|
            t.string :name
            t.text :description
            t.belongs_to :user, index: true
            t.integer :nb_participants
            t.datetime :date
            t.text :iframe_url
            t.timestamps null: false
        end
    end
end
