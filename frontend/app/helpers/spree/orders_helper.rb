module Spree
  module OrdersHelper
    def truncated_product_description(product)
      if product.description.present?
        truncate(strip_tags(product.description), length: 120, separator: ' ', omission: '...')
      end
    end

    def order_just_completed?(order)
      flash[:order_completed] && order.present?
    end
  end
end
