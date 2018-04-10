module ProductsFormatter
  class Products
    def initialize(products)
      @products = products
    end

    def generate
      @products.map { |product| fetch_product(product.as_json) }
    end

    private

    def fetch_product(product)
      change_attribue(product)
      # binding.pry
      product.except!('created_at')
    end

    def change_attribue(product)
      product['quantity'] = product['quantity'].to_i
      # binding.pry
      product
    end
  end
end
