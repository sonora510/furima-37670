class OrdersController < ApplicationController
  # 非ログインユーザーをログインページへ誘導する
  before_action :authenticate_user!, only: [:index, :create]

  # 商品情報の引き渡し
  before_action :set_item, only: [:index, :create]

  def index
    @order_addressbook = OrderAddressbook.new
    return redirect_to root_path if current_user.id == @item.user_id || !@item.order.nil?
  
  end

  def create
    @order_addressbook = OrderAddressbook.new(order_params)

    if @order_addressbook.valid?
      pay_item
      @order_addressbook.save
      redirect_to root_path
    else
      render 'index'

    end
  end

  private

  # 商品情報
  def set_item
    @item = Item.find(params[:item_id])
  end

  # 購入情報 permit>フォームで入力する情報
  def order_params
    params.require(:order_addressbook)
    .permit(:post_code, :prefecture_id, :city, :banti, :bilding_name,:phone_num)
    .merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  # 発送情報ここは不要になる？
  # def addressbook_params
  # params.permit(:order, :post_code, :prefecture_id, :city, :banti, :bilding_name, :phone_num).merge(order_id: @order.id)
  # end
end
