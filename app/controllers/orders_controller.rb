class OrdersController < ApplicationController

  def index
  end

  def create

  end

  def new
  end


  def show
    @order = find_order(params)
  end


  def edit
  end
  
  def update
  end

  def destroy
  end

  private
  def order_params
    params.permit()
  end

  def find_order
    Order.find(params[:id])
  end

end
