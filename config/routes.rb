Clahub::Application.routes.draw do
  root to: "pages#home", :as => :home
  get "/pages/*id" => 'pages#show', as: :page, format: false

  get 'auth/github/callback' => 'github_oauth#callback', :as => :github_oauth_callback
  get 'auth/github_limited/callback' => 'github_limited_oauth#callback', :as => :github_limited_oauth_callback
  get 'auth/failure' => 'github_oauth#failure'
  get 'sign_out' => 'sessions#destroy', :as => :sign_out

  resources :repos, only: [:index]
  resources :agreements, only: [:index, :new, :create]

  constraints :repo_name => /[^\/]+/ do
    get 'agreements/:user_name/:repo_name.csv' => 'agreements#show', :format => :csv
    get 'agreements/:user_name/:repo_name' => 'agreements#show', :as => :agreement
    delete 'agreements/:user_name/:repo_name' => 'agreements#destroy'
    post 'agreements/:user_name/:repo_name/signatures' => 'signatures#create', :as => :agreement_signature
  end

  post 'repo_hook' => 'github_webhooks#repo_hook'

  resource :markdown_preview
end
