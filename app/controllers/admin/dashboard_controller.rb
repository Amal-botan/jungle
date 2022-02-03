class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_USER_KEY"], password: ENV["ADMIN_SECRET_KEY"]

  def show
    @category_count = Category.count
    @product_count = Product.count
  end
end
