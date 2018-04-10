module ProductsFormatter
  class Product
    def initialize(product)
      @product = product
    end

    def generate
      @product.attributes.except('created_at', 'updated_at')
    end

  end
end
