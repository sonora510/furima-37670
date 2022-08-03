class OrdersController < ApplicationController
  # 非ログインユーザーをログインページへ誘導する
  before_action :authenticate_user!, only: [:index, :new, :create]

  # 商品情報の引き渡し
  before_action :set_item, only: [:index]

  def index
  end

  def new
  end

  def create
    @order =Order.create(order_params)
    Addressbook.create(addressbook_params)
    redirect_to root_path
  end

  private

  # 商品情報
  def set_item
    @item = Item.find(params[:item_id])
  end

  # 購入情報
  def order_params
    params.permit(:item_id, :user_id).merge(user_id: current_user.id)
  end

  # 発送情報
  def addressbook_params
    params.permit(:order, :post_code, :prefecture_id, :city, :banti, :bilding_name, :phone_num).merge(order_id: @order.id)
  end
end
