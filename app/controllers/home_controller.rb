class HomeController < ApplicationController
  def index
    @card = Card.ready_to_review
      .order('RANDOM()').first
    respond_to do |format|
      format.html
    end
  end
end
