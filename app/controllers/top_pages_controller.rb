class TopPagesController < ApplicationController

  def home
  end

  def index
    @portfolios = Portfolio.all
    @arrival = Portfolio.limit(5).order("created_at DESC")
    @portfolio_all = Portfolio.order("RANDOM()").all
  end

  def rules
  end

  def privacy
  end

  def contact
  end
end
