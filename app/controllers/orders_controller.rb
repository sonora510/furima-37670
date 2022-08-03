class OrdersController < ApplicationController
  # 非ログインユーザーをログインページへ誘導する
  before_action :authenticate_user!, only: [:index, :new, :create]

  # 情報の引き渡し
  before_action :set_item, only: [:index]

  def index
  end

  def new
  end

  def create
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
end
