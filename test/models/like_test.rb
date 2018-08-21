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

require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
