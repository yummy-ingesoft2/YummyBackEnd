class OrdersController < ApplicationController
def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to [@order.orderable], notice: 'Order created'
    else
      render :new
    end
end

  private

  def order_params
    params.require(:order).permit(:state, :quantity,:cost,:order_date, :orderable_id, :orderable_type)
  end
end
