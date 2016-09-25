class AddUserPseudo < ActiveRecord::Migration
    def change
        remove_column :users, :name, :string
        remove_column :users, :lastname, :string
        add_column :users, :nickname, :string
    end
end
