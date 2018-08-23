class PortfoliosController < ApplicationController
  before_action :logged_in_user, only: %i[new create edit destroy]
  before_action :correct_user, only: %i[destroy edit]
  impressionist :actions => [:show]

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
    @portfolio = Portfolio.friendly.find(params[:id])
  end

  def update
    @portfolio = Portfolio.friendly.find(params[:id])
    if @portfolio.update_attributes(portfolio_params)
      flash[:success] = "投稿情報の編集が完了しました。"
      redirect_to @portfolio
    else
      render 'edit'
    end
  end

  def show
    @portfolio = Portfolio.friendly.find(params[:id])
    impressionist(@portfolio, nil, unique: [:session_hash])
    if logged_in?
      @comment = Comment.new(portfolio_id: @portfolio.id, user_id: current_user.id)
    end
  end

  def destroy
    Portfolio.friendly.find(params[:id]).destroy
    flash[:success] = "削除が完了しました"
    redirect_to porpos_path
  end

  private

    def portfolio_params
      params.require(:portfolio).permit(:title,:description,:URL,:git_URL,:catcheye_img,:release)
    end

    def correct_user
      unless current_user.admin?
        @portfolio = current_user.portfolios.friendly.find(params[:id])
        redirect_to root_url if @portfolio.nil?
      end
    end
end
