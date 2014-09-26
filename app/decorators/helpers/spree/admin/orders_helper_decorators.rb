module Spree
  module Admin
    OrdersHelper.module_eval do
      def display_delivery_type type
        delivery_types = { 1 => 'delivery', 2 => 'delivery later', 3 => 'not delivery' }
        delivery_types[type] || 'not asigned'
      end

      def display_delivery_time time
        time && time.strftime('%m/%d/%Y at %I:%M%p')
      end
    end
  end
end
