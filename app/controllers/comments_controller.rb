class CommentsController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
    @comment = Comment.new
  end

  def create
    @item = Item.find(params[:item_id])
    @item.reviews.create(comment_params)
  end

  def comment_params
    params.require(:comment).permit(:thoughts)
  end
end
