Rails.application.routes.draw do
  # get 'sms/send'
  devise_for :users, controllers: {
                       sessions: "users/sessions",
                       registrations: "users/registrations",
                     }

  # get current user
  get "/current_user", to: "currents#index"

  namespace :api do
    namespace :v1 do
      resources :profiles, only: [:index]
    end

    resources :users, only: [] do
      member do
        get 'search_and_match', to: 'search_and_match#search_and_match'
      end
    end
    resources :communications, only: [:create, :index]
    resources :feedbacks, only: [:create, :index]
    resources :rankings, only: [:index]
  end

  post '/send_sms', to: 'sms#send'
  # match '*path', via: :all, to: -> (env) { [404, {}, ['']] }
end
