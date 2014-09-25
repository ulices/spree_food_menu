module Spree
  class MenuProductDay < Spree::Base
    belongs_to :menu
    belongs_to :product
  end
end
