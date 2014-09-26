module Spree
  module Admin
    OrdersHelper.module_eval do
      def display_delivery_type type
        delivery_types = { 1 => 'sale on store', 2 => 'delivery to home', 3 => 'scheduled to get on store' }
        delivery_types[type] || 'not asigned'
      end

      def display_delivery_time time
        time && time.strftime('%m/%d/%Y at %I:%M%p')
      end
    end
  end
end
