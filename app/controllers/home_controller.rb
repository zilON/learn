class HomeController < ApplicationController
  def index
    @card = Card.ready_to_review
    respond_to do |format|
      format.html
    end
  end
end
