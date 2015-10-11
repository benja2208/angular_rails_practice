class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @item.comments.build(comment_params)
    if @comment.save
      flash[:success] = "You commented the hell out of that post!"
      redirect_to :back
    else
      flash[:alert] = "Check the comment form, something went horribly wrong."
      render root_path
    end
  end

  def destroy
    @comment = @item.comments.find(params[:id])
    @comment.destroy
    flash[:success] = "Comment deleted :("
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:thoughts)
  end

  def set_post
    @item = Item.find(params[:item_id])
  end
end
