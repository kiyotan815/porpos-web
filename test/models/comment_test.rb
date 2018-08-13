# == Schema Information
#
# Table name: comments
#
#  id           :bigint(8)        not null, primary key
#  comment      :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  portfolio_id :bigint(8)
#
# Indexes
#
#  index_comments_on_portfolio_id                 (portfolio_id)
#  index_comments_on_portfolio_id_and_created_at  (portfolio_id,created_at)
#
# Foreign Keys
#
#  fk_rails_...  (portfolio_id => portfolios.id)
#

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
