Spree::Core::Engine.routes.draw do

  namespace :admin do
    resources :menus
    resources :menu_product_days, only: [:create, :destroy]
  end

  namespace :api do
    resources :menu_product_days, only: [:create] do
      collection do
        post 'create_with_products'
      end
    end
  end

end
