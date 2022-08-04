class ItemsController < ApplicationController
  # 非ログインユーザーをログインページへ誘導
  before_action :authenticate_user!, only: [:new, :edit, :create, :destroy]
  # 情報の引き渡し
  before_action :set_item, only: [:show, :destroy, :edit, :update]
  

  def index
    @items = Item.all.order('created_at DESC')
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

  def show
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
    end
    redirect_to action: :index
  end

  def edit
    if current_user.id != @item.user_id
    redirect_to action: :index
    end
  end

  def update
    if
    @item.update(item_params)
    redirect_to action: :show
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product, :information, :category_id, :status_id, :delivery_cost_id, :delivery_day_id,
                                 :prefecture_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
