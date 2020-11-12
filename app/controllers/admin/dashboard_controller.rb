class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["admin_username"],password: ENV["admin_password"],except: [:show] 
  
  def show
    @products_count = Product.count
    @categories_count = Category.count
  end
end
