class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :non_purchased_item, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
   
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item 
      @order_form.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      # バリデーションエラーのログ出力
    Rails.logger.debug("Validation failed: " + @order_form.errors.full_messages.to_sentence)
      render :index, status: :unprocessable_entity
    end
  end
  

  private
  before_action :set_item, only: [:index]

  def order_params
    permitted_params = params.require(:order_form).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number)
    permitted_params.merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @order_form.item_price, # 商品の値段
      card: order_params[:token], # トークンを取得
      currency: 'jpy'              # 通貨の種類（日本円）
    )
  end
  def non_purchased_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
