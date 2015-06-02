Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :zip_codes
  end
end
