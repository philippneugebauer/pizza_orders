class PromotionsController < ApplicationController
  before_action :set_promotion, only: %i[ show edit update destroy ]

  # GET /promotions or /promotions.json
  def index
    @promotions = Promotion.all
  end

  # GET /promotions/new
  def new
    @promotion = Promotion.new
  end

  # GET /promotions/1/edit
  def edit
  end

  # POST /promotions or /promotions.json
  def create
    @promotion = Promotion.new(promotion_params)

    respond_to do |format|
      if @promotion.save
        format.html { redirect_to promotions_url, notice: "Promotion was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /promotions/1 or /promotions/1.json
  def update
    respond_to do |format|
      if @promotion.update(promotion_params)
        format.html { redirect_to promotions_url, notice: "Promotion was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /promotions/1 or /promotions/1.json
  def destroy
    @promotion.destroy

    respond_to do |format|
      format.html { redirect_to promotions_url, notice: "Promotion was successfully destroyed." }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_promotion
    @promotion = Promotion.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def promotion_params
    params.require(:promotion).permit(:code, :from, :to, :pizza_size_id, :pizza_id)
  end
end
