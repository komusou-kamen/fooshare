class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
    
  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product= Product.new(product_params)
    
    if @product.save
      flash[:success] = '出品手続きが完了しました'
      redirect_to @product
    else 
      flash.now[:danger] = '出品手続きに失敗しました'
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      flash[:success] = '正常に更新されました'
      redirect_to @product
    else
      flash.now[:danger] = '更新に失敗しました'
      render :edit
    end
  end

  def destroy
      @product.destroy

    flash[:success] = '正常に削除されました'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def set_product
    @product = Product.find(params[:id])
  end
  
   # Strong Parameter
  def product_params
    params.require(:product).permit(:content, :name, :price)
  end
  
  def correct_user
    @product = current_user.products.find_by(id: params[:id])
    unless @product
      redirect_to root_url
    end
  end
end
