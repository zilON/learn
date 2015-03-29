class ReviewsController < ApplicationController
  before_filter :set_card, only: [:update, :show]

  def update
    flash[:error] = nil
    respond_to do |format|
      if @card.check_translation(card_params[:original_text])
        format.html { redirect_to @card, notice: That is rigtht! }

        flash[:notice] = 'That is rigtht!'
        @card.update_review_date!
        redirect_to root_path
      else
        flash[:error] = 'Invalid translation, try again!'
        render :show
      end
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


