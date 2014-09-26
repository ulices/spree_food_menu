class Spree::Admin::MenusController < Spree::Admin::ResourceController

  def index
    @menus = Spree::Menu.all
  end

  def new
    @menu = Spree::Menu.new
  end

  def create
    @menu = Spree::Menu.create menu_params
    if @menu.errors.any?
      flash[:error] = @menu.errors.full_messages.join(', ')
      render :new
    else
      redirect_to admin_menus_path
    end
  end

  private

  def menu_params
    params.require(:menu).permit(permitted_params)
  end

  def permitted_params
    [:version, :start_date, :end_date]
  end

end
