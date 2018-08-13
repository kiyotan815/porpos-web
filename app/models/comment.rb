# == Schema Information
#
# Table name: comments
#
#  id           :bigint(8)        not null, primary key
#  comment      :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  portfolio_id :bigint(8)
#  user_id      :bigint(8)
#
# Indexes
#
#  index_comments_on_portfolio_id                 (portfolio_id)
#  index_comments_on_portfolio_id_and_created_at  (portfolio_id,created_at)
#  index_comments_on_user_id                      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (portfolio_id => portfolios.id)
#  fk_rails_...  (user_id => users.id)
#

class Comment < ApplicationRecord
  belongs_to :portfolio
  belongs_to :user
  validates :comment, presence: true, length: { maximum: 1024 }
end
