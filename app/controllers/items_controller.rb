class ItemsController < ApplicationController
  # 商品一覧機能の実装で記述する部分なので、一旦コメントアウト

  # before_action :authenticate_user!, only: [:new, :create]

  # def index
  #  @items = Item.order('created_at DESC')
  # end

  # //商品一覧機能の実装で記述する部分なので、一旦コメントアウト

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :condition_id, :shipping_fee_id, :prefecture_id,
                                 :shipping_day_id, :image)
  end
end
