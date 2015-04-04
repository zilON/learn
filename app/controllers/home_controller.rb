class HomeController < ApplicationController
  def index
    @card = Card.ready_to_review.first
    respond_to do |format|
      format.html
    end
  end
end
