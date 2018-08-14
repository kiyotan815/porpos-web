class AdministratorsController < ApplicationController
  before_action :admin_user

  def users_index
    @users = User.all
  end

  def portfolios_index
    @portfolios = Portfolio.all
  end

  def portfolio_destroy
    Portfolio.friendly.find(params[:id]).destroy
    flash[:success] = "削除が完了しました"
    redirect_to portfolios_index_path
  end
end
