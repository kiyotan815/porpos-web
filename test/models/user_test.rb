# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  admin           :boolean          default(FALSE)
#  email           :string
#  icon_img        :string
#  name            :string
#  password_digest :string
#  uuid            :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  portfolio_id    :bigint(8)
#
# Indexes
#
#  index_users_on_email         (email) UNIQUE
#  index_users_on_portfolio_id  (portfolio_id)
#
# Foreign Keys
#
#  fk_rails_...  (portfolio_id => portfolios.id)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
