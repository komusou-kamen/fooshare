class ToppagesController < ApplicationController
  def index
    @products = Product.all.order(id: :desc).page(params[:page]).per(21)
  end
end
