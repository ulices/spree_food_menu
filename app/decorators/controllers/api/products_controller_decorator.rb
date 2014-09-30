Spree::Api::ProductsController.class_eval do
  before_filter :select_active_menu, only: [:index]

  def index
    @menu_products ||= @active_menu.menu_of_the_week

    respond_with(@menu_products)
  end

  private

  def select_active_menu
    @active_menu ||= Spree::Menu.active_menu
  end

end
