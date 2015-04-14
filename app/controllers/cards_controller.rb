class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  def index
    @cards = current_user.cards.page(params[:page]).per(20)
  end

  def show
  end

  def new
    @card = Card.new
  end

  def edit
  end

  def create
    @card = current_user.cards.build(card_params)
    if @card.save
      format.html { redirect_to @card, notice: t("card.created")  }
    else
      format.html { render action: "new" }
    end
  end

  def update
    if @card.update(card_params)
      format.html { redirect_to @card, notice: t("card.updated") }
    else
      format.html { render action: "edit" }
    end
  end

  def destroy
    @card.destroy
    format.html { redirect_to cards_url, notice: t("card.deleted") }
  end

  private

    def set_card
      @card = current_user.cards.find(params[:id])
    end

    def card_params
      params.require(:card).permit(:original_text, :translated_text)
    end
end
