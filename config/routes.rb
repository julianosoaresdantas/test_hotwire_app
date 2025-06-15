# config/routes.rb
Rails.application.routes.draw do
  resources :articles # This line should have been added by the scaffold
  # Add your root if you haven't already
  root "articles#index"
end
