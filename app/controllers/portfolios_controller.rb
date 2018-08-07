class PortfoliosController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]
  before_action :admin_user, only: [:destroy, :index]
  def index
    @portfolios = Portfolio.all
  end

  def new
    @portfolio = Portfolio.new(flash[:portfolio])
  end

  def create
    @portfolio = current_user.portfolios.build(portfolio_params)
    if @portfolio.save
      flash[:success] = "PorPos!　投稿が完了しました!"
      redirect_to porpos_path
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @portfolio = Portfolio.find(params[:id])
  end

  def destroy
    Portfolio.find(params[:id]).destroy
    flash[:success] = "削除が完了しました"
    redirect_to portfolios_url
  end

  private

    def portfolio_params
      params.require(:portfolio).permit(:title,:description,:URL,:git_URL,:catcheye_img,:release)
    end
end
