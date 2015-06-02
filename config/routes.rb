Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :zip_codes
  end
end
