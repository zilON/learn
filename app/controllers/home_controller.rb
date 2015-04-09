class HomeController < ApplicationController
  def index
    if current_user
      @card = current_user.cards.ready_to_review.first
      respond_to do |format|
        format.html
      end
    end
  end
end
