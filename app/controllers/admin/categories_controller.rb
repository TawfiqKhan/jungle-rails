class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.order(:id).all
    # @products = Product.all
  end

  def new
  end
end
