Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :issues, only: [:index, :show] do
    resources :events, only: [:index, :show]
  end

  get 'webhook', to: 'integrations/webhook'

  root 'issues#index'
end
