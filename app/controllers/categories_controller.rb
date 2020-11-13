class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
    puts @products.inspect
  end

end

# def show
#   @order = Order.find(params[:id])
#   puts @order.line_items.inspect
#   @line_items = @order.line_items.map { |item| {item: item, quantity: item[:quantity], product: Product.find_by(id: item[:product_id]) } }
#   puts @line_items.inspect
# end
