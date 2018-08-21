# == Schema Information
#
# Table name: likes
#
#  id           :bigint(8)        not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  portfolio_id :integer          not null
#  user_id      :integer          not null
#
# Indexes
#
#  index_likes_on_portfolio_id              (portfolio_id)
#  index_likes_on_user_id                   (user_id)
#  index_likes_on_user_id_and_portfolio_id  (user_id,portfolio_id) UNIQUE
#

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :portfolio
  validates  :user_id, presence: true
  validates  :portfolio_id, presence: true
end
