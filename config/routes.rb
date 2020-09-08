Rails.application.routes.draw do
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  # These are 'static' pages which doesn't need resources
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs
  root to: 'pages#home'
end
