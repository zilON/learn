class HomeController < ApplicationController
  def index
    if current_user
      @card = current_user.cards.ready_to_review.first
    end
  end
end
