class TopPagesController < ApplicationController

  def home
  end

  def index
    @portfolios = Portfolio.all
    @arrival = Portfolio.limit(4).order("created_at DESC")
    @portfolio_all = Portfolio.all
  end

  def rules
  end

  def privacy
  end

  def contact
  end
end
