class Public::OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @order = Order.find()
  end

  def complete
  end
end
