class Spree::Api::MenuProductDaysController < Spree::Api::BaseController
  def create
    @menu_product_day = Spree::MenuProductDay.create menu_product_day_params
    return invalid_create_attempt unless @menu_product_day.valid?
    respond_with(@menu_product_day)
  end

  def create_with_products
    @response, product_id, menu_id = [{}, nil, nil]
    begin
      ActiveRecord::Base.transaction do
        menu_id = menu_product_day_params[:menu_id]
        menu_product_day_params[:product_ids].each do |id|
          product_id       = id
          menu_product_day = create_menu_product_day! menu_id, product_id, menu_product_day_params[:day]
          unless @response[menu_product_day.day]
            @response[menu_product_day.day] = { products: [], day: menu_product_day.day }
          end
          @response[menu_product_day.day][:products] << menu_product_day.product
        end
      end
      respond_with(@response)
    rescue Exception
      invalid_create_with_products_attempt(menu_id, product_id)
    end
  end

  private

  def menu_product_day_params
    params.require(:menu_product_day).permit(permitted_params)
  end

  def permitted_params
    [:menu_id, :product_id, :day, product_ids: []]
  end

  def create_menu_product_day!(menu_id, product_id, day)
    Spree::MenuProductDay.create! menu_id: menu_id, product_id: product_id, day: day
  end

  def invalid_create_attempt
    render json: { error: 'The creation of the menu failed' }, status: :unprocessable_entity
  end

  def invalid_create_with_products_attempt(menu_id, product_id)
    error_message = menu_id ? "Product with id: #{product_id}" : "Menu with id: #{menu_id}"
    render json: { error: "#{error_message} doesn't exist" }, status: :unprocessable_entity
  end
end