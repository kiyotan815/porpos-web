class PortfoliosController < ApplicationController
  before_action :logged_in_user , only: [:new, :create]

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = current_user.portfolios.build(portfolio_params)
    if @portfolio.save
      flash[:success] = "PorPos!　投稿が完了しました!"
      redirect_to porpos_path
    else
      render '/porpos'
    end
  end

  def edit
  end

  def show
    @portfolio = Portfolio.find(params[:id])
  end

  private

    def portfolio_params
      params.require(:portfolio).permit(:title,:description,:URL,:git_URL,:catcheye_img,:release)
    end
end
