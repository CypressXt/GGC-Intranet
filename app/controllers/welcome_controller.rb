class WelcomeController < ApplicationController

    def index
        @infos = Info.all.order(created_at: :desc)
    end
end
