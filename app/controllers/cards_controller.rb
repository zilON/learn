class CardsController < ApplicationController
  def index
    @cards = Card.all.order("created_at DESC")
  end

  def show
    @card = Card.find(params[:id])
  end

  def new
    @card = Card.new
  end

  def edit
  end

  def create
    @card = Card.new(card_params)

    if @card.save
      redirect_to cards_path
    else
      render 'new'
    end
  end

  def update
    @card = Card.find(cards_path)

    if @card.update(card_params)
      redirect_to @card
    else
      render 'edit'
    end
  end

  def destroy
    @card = Card.find(card_params)
    @card.destroy
    redirect_to cards_path
  end

  private

    def card_params
      params.require(:card).permit(:original_text, :translated_text, :review_date)
    end
end

