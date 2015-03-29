class ReviewsController < ApplicationController
  before_filter :set_card, only: [:update, :show]
  def update

    if @card.check_translation(card_params[:original_text])
      @card.update_review_date!
      redirect_to root_path
      flash[:success] =  t("card.review_success")
    else
      flash.now[:error] = t("card.review_error")
      render :show
    end

  end

  def show
    @card
  end

  private

    def set_card
      @card = Card.find(params[:id])
    end

    def card_params
      params.require(:card).permit(:original_text)
    end
end


