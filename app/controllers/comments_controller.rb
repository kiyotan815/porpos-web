class CommentsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]

	def create
		comment = Comment.new(comment_params)
		if comment.save
			flash[:success] = 'コメントを投稿しました'
			redirect_to comment.portfolio
		else
			redirect_to :back, flash: {
				comment: comment,
				error_messages: comment.errors.full_messages
			}
		end
	end

	def destroy
		comment = Comment.find(params[:id])
    comment.delete
    redirect_to comment.portfolio, flash: { danger: 'コメントが削除されました' }
	end

	private

	def comment_params
    params.require(:comment).permit(:portfolio_id, :comment)
  end
end
