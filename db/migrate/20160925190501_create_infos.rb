class CreateInfos < ActiveRecord::Migration
    def change
        create_table :infos do |t|
            t.string :title
            t.text :content
            t.belongs_to :user, index: true
            t.timestamps null: false
        end
    end
end
