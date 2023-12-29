class ItemsController < ApplicationController
  # ユーザーがログインしていなければ、そのユーザーをログイン画面に遷移させる
  before_action :authenticate_user!, except: [:index, :show]

  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
     #@items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path 
    else
      render :new
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    # ストロングパラメータを設定
    params.require(:item).permit(:name, :description, :category_id, :price, :image)#.merge(user_id: current_user.id)
  end
end
