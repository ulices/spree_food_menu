cache [I18n.locale, @current_user_roles.include?('admin'), 'small_variant', root_object]

attributes :id, :in_stock, :is_master

node(:in_stock) { |v| v.in_stock? }

child(images: :images) { extends "spree/api/images/show" }
