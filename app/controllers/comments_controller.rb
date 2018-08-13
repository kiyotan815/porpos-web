class CommentsController < ApplicationController
	before_action :logged_in_user, only: %i[create destroy]
	before_action :correct_user, only: %i[destroy]
	def create
		comment = Comment.new(comment_params)
		if comment.save
			flash[:success] = 'コメントを投稿しました'
			redirect_to comment.portfolio
		else
			redirect_back fallback_location: root_path
			flash[:danger]= "コメントを入力してください"
		end
	end

	def destroy
		comment = Comment.find(params[:id])
    comment.delete
    redirect_to comment.portfolio, flash: { danger: 'コメントが削除されました' }
	end

	private

	def comment_params
    params.require(:comment).permit(:portfolio_id, :comment, :user_id)
  end

	def correct_user
		@comment = current_user.comments.find_by(id: params[:id])
		redirect_to root_url if @comment.nil?
	end
end
