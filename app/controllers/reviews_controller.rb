class ReviewsController < ApplicationController
  before_action :set_card, only: [:update, :show]

  def update
    if @card.check_translation(review_params[:original_text])
      redirect_to root_path
      flash[:success] = t("card.review_success")
    else
      flash.now[:error] = t("card.review_error")
      render :show
    end
  end

  def show
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def review_params
    params.require(:card).permit(:original_text)
  end
end
