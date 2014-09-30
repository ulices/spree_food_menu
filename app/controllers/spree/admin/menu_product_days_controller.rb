class Spree::Admin::MenuProductDaysController < Spree::Admin::ResourceController

  def create
    @menu_product_day = Spree::MenuProductDay.create menu_product_day_params
    if @menu_product_day.errors.any?
      flash[:error] = @menu_product_day.errors.full_messages.join(', ')
      redirect_to :back
    else
      flash[:success] = 'Product added to menu'
      respond_with(@menu_product_day)
    end

  end

  private

  def menu_product_day_params
    params.require(:menu_product_day).permit(permitted_params)
  end

  def permitted_params
    [:menu_id, :product_id, :day]
  end
end
