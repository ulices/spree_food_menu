object @image
attributes :id, :attachment_file_name
node(:product_url) { |i| i.attachment.url(:product) }
