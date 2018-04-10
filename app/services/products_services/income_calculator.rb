module ProductsServices
  # calculate income to products
  class IncomeCalculator
    def initialize(products)
      @products = products
    end

    def execute
      products = @products.map { |product| add_income_attribute(product.as_json) }
      ProductsFormatter::Products.new(products).generate
    end

    private

    def add_income_attribute(product)
      product.merge!(income: calculate_income(product))
    end

    def calculate_income(product)
      product['quantity'].to_i * product['price'].to_f
    end
  end
end
