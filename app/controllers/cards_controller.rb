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
      redirect_to  action: 'index'
    else
      render 'new'
    end
  end

  def update
    @card = Card.find(params[:id])

    if @card.update(card_params)
      redirect_to @card
    else
      render 'update'
    end
  end

  def destroy
    @card = Card.find(params[:id])

    @card.destroy
    redirect_to  action: 'index'
  end

  private

    def card_params
      params.require(:card).permit(:original_text, :translated_text, :review_date)
    end
end

