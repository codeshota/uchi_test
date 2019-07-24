Rails.application.routes.draw do
  root 'contributors#index'
  post "contributors" => "contributors#index"
  resources :contributors
end
