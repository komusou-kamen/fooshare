class UsersController < ApplicationController
  include SessionsHelper
  before_action :require_user_logged_in, only: [:show, :edit, :update, :products]
  
  def show
    @user = @current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def edit
    @user = @current_user
  end

  def update
    if @current_user.update(user_params)
      flash[:success] = '正常に更新されました'
      redirect_to @current_user
    else
      flash.now[:danger] = '更新に失敗しました'
      render :edit
    end
  end
  
  def products
    @user = @current_user
    @products = current_user.products.page(params[:page])
    #counts(@user)
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :phone, :address, :password, :password_confirmation)
  end
end
