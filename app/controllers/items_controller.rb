class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
  	@item = Item.new
  end

  def create
  	Item.create(item_params)
  	redirect_to items_path
  end

  def item_params
  	params.require(:item).permit(:description, :store, :price)
  end
end
