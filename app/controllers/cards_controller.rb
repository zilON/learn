class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  def index
    @cards = Card.all

    respond_to do |format|
      format.html
    end
  end

  def show
    respond_to do |format|
      format.html
    end
  end

  def new
    @card = Card.new
    respond_to do |format|
      format.html
    end
  end

  def edit
  end

  def create
    @card = Card.new(card_params)

    respond_to do |format|
      if @card.save
        format.html { redirect_to @card, notice: t("card.created")  }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to @card, notice: t("card.updated") }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    respond_to do |format|
      @card.destroy
      format.html { redirect_to cards_url, notice: t("card.deleted") }
    end
  end

  private

    def set_card
      @card = Card.find(params[:id])
    end

    def card_params
      params.require(:card).permit(:original_text, :translated_text, :review_date)
    end
end
