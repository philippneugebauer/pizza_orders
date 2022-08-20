class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  def index
    @orders = Order.open
  end

  # GET /orders/new
  def new
    @order = Order.new
    @order.order_items.build
  end

  # POST /orders or /orders.json
  def create
    @order = Order.build(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to orders_path, notice: "Order was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    @order.update(state: "completed")

    redirect_to orders_path, notice: "Order completed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit(
      :discount_id,
      promotions: [],
      order_items_attributes: [
        :id, :pizza_id, :pizza_size_id, :_destroy, { extras: [] }, { omited: [] }
      ]
    )
  end
end
