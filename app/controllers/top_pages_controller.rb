class TopPagesController < ApplicationController

  def home
  end

  def index
    @arrivals = Portfolio.limit(4).order("created_at DESC")
    @portfolios = Portfolio.order("RANDOM()").all
  end

  def rules
  end

  def privacy
  end

  def contact
  end
end
