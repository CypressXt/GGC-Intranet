Rails.application.routes.draw do
    root 'welcome#index'

    get 'csgo' => 'tournament#csgo'
    get 'hs' => 'tournament#hs'
    get 'lol' => 'tournament#lol'
    get 'aram' => 'tournament#aram'

    get 'rules'  => 'static#rules'
    get 'planning'  => 'static#planning'
    get 'map'  => 'static#map'
    get 'partners' => 'static#partners'

    resources :user
    resources :info
    resources :animation do
        get 'delete'  => 'animation#delete'
        get 'join' => 'animation_participant#new'
        post 'create' => 'animation_participant#create'
        get 'leave' => 'animation_participant#delete'
        delete 'leave' => 'animation_participant#destroy'
        get 'kick/:participant_id' => 'animation_participant#kick', as: :kick_participant
        delete 'kick/:participant_id' => 'animation_participant#kicked', as: :kicked_participant
    end

    # Session -------------------
    get 'login' => 'session#new'
    post 'login' => 'session#create'
    delete 'logout' => 'session#destroy'
    # ---------------------------
end
