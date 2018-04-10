# products CRUD
class ProductsController < ActionController::API
  before_action :product_params, only: %i[create]

  def index
    products = Product.all
    response = ProductsServices::IncomeCalculator.new(products).execute
    render json: Response.new.success(nil, response)
  end

  def create
    product = Product.new(product_params)
    if product.save
      response = ProductsFormatter::Product.new(product).generate
      render json: Response.new.success('Product created succesfully', response)
    else
      render json: Response.new.failure(product.errors.full_messages.join(', '), nil)
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :quantity)
  end
end
