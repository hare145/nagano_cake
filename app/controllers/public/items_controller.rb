class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
    @item_count = Item.count
    @genres = Genre.all
    @item_genre = Item.where(genre_id: params[:genre_id])
    @item_genre_count = Item.where(genre_id: params[:genre_id]).count
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end
  
end
