class TopPagesController < ApplicationController

  def home
  end

  def index
    @portfolios = Portfolio.all
    @arrival = Portfolio.limit(4).order("created_at DESC")
    @portfolio_all = Portfolio.all.order("created_at DESC")
  end

  def rules
  end

  def privacy
  end

  def contact
  end
end
