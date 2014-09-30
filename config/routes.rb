Spree::Core::Engine.routes.draw do

  namespace :admin do
    resources :menus
    resources :menu_product_days, only: [:create, :destroy]
  end

end
