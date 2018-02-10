# products CRUD
class ProductsController < ActionController::API
  before_action :product_params, only: %i[create]

  def index
    @products = Product.all
    render json: { success: true, stataus: 200, message: nil, data: @products } 
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render json: { success: true, stataus: 200, message: 'Product created succesfully', data: @product }
    else
      render json: { success: false, stataus: 404, message: @product.errors.full_messages.join(', '), data: nil }
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :quantity)
  end
end
