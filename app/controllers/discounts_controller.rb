class DiscountsController < ApplicationController
  before_action :set_discount, only: %i[ show edit update destroy ]

  # GET /discounts or /discounts.json
  def index
    @discounts = Discount.all
  end

  # GET /discounts/new
  def new
    @discount = Discount.new
  end

  # GET /discounts/1/edit
  def edit
  end

  # POST /discounts or /discounts.json
  def create
    @discount = Discount.new(discount_params)

    respond_to do |format|
      if @discount.save
        format.html { redirect_to discount_url(@discount), notice: "Discount was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discounts/1 or /discounts/1.json
  def update
    respond_to do |format|
      if @discount.update(discount_params)
        format.html { redirect_to discount_url(@discount), notice: "Discount was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discounts/1 or /discounts/1.json
  def destroy
    @discount.destroy

    respond_to do |format|
      format.html { redirect_to discounts_url, notice: "Discount was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discount
      @discount = Discount.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def discount_params
      params.require(:discount).permit(:code, :percentage)
    end
end
