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
    end

    # Session -------------------
    get 'login' => 'session#new'
    post 'login' => 'session#create'
    delete 'logout' => 'session#destroy'
    # ---------------------------
end
