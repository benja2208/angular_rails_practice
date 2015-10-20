class LikesController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @item.likes.create
    render json: {new_like_count: @item.likes.count}
  end
end
