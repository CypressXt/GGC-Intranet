Rails.application.routes.draw do
    root 'welcome#index'

    get 'csgo' => 'tournament#csgo'
    get 'hs' => 'tournament#hs'
    get 'lol' => 'tournament#lol'
    get 'aram' => 'tournament#aram'
    get 'owatch' => 'tournament#owatch'

    get 'rules'  => 'static#rules'
    get 'planning'  => 'static#planning'
    get 'map'  => 'static#map'

    resources :user
    resources :info

    # Session -------------------
    get 'login' => 'session#new'
    post 'login' => 'session#create'
    delete 'logout' => 'session#destroy'
    # ---------------------------
end
