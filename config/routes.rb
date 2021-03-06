Rails.application.routes.draw do
  root to: "conferences#index"

  # Devise user authentication ----------------------------------------------------------------------
  devise_for :users, controllers: { registrations: "users/registrations", sessions: "users/sessions" }

  devise_scope :user do
    get "register", to: "users/registrations#new"
    get "signin", to: "users/sessions#new"
  end

  # -- Routes -----------------------------------------------------------------------------------------

  resources :users
  get "profile", to: "users#show", as: "profile_show"

  resources :conferences do
    resources :events
    resources :conf_attendees
  end

  get ":url", to: 'conferences#show', as: "conference_show"
end
