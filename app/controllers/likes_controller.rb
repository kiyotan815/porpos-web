class LikesController < ApplicationController
  before_action :logged_in_user

  def create
    @portfolio = Portfolio.find(params[:portfolio_id])
    unless @portfolio.iine?(current_user)
      @portfolio.iine(current_user)
      respond_to do |format|
        format.html { redirect_to request.referrer || porpos_path}
        format.js
      end
    end
  end

  def destroy
    @portfolio = Like.find(params[:id]).portfolio
    if @portfolio.iine?(current_user)
      @portfolio.uniine(current_user)
      respond_to do |format|
        format.html { redirect_to request.referrer || porpos_path }
        format.js
      end
    end
  end
  
end
