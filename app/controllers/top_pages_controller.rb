class TopPagesController < ApplicationController

  def home
  end

  def index
    @portfolios = Portfolio.all
    @arrival = Portfolio.limit(3).order("created_at DESC")
  end

  def rules
  end

  def privacy
  end

  def contact
  end
end
