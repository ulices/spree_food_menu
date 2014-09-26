Spree::Core::Engine.routes.draw do

  namespace :admin do
    resources :menus
  end

end
