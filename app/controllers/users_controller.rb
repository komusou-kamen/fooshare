class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :edit, :update]
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
  end

  def edit
  end

  def update
  end
end
