class PortfoliosController < ApplicationController
  before_action :logged_in_user, only: %i[new create edit index destroy]
  before_action :admin_user, only: %i[index]
  before_action :correct_user, only: %i[destroy edit]
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
    @portfolio = Portfolio.friendly.find(params[:id])
    if logged_in?
      @comment = Comment.new(portfolio_id: @portfolio.id, user_id: current_user.id)
    end
  end

  def destroy
    Portfolio.friendly.find(params[:id]).destroy
    flash[:success] = "削除が完了しました"
    redirect_to portfolios_url
  end

  private

    def portfolio_params
      params.require(:portfolio).permit(:title,:description,:URL,:git_URL,:catcheye_img,:release)
    end

    def correct_user
      @portfolio = current_user.portfolios.friendly.find(params[:id])
      redirect_to root_url if @portfolio.nil?
    end
end
