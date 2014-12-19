Spree::Api::CheckoutsController.class_eval do

  private

  def add_order_line_items
    params[:order][:line_items].each do |item|
      variant = Spree::Variant.find(item[:variant_id])
      line_item = @order.contents.add(variant, item[:comment], item[:quantity] || 1)
      line_item.delivery_type = item[:delivery_type]
      line_item.delivery_time = item[:delivery_time].to_time
      line_item.save!
    end
  end
end
