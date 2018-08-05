# == Schema Information
#
# Table name: portfolios
#
#  id           :bigint(8)        not null, primary key
#  URL          :text
#  catcheye_img :string
#  description  :text
#  git_URL      :text
#  release      :boolean          default(TRUE)
#  title        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint(8)
#
# Indexes
#
#  index_portfolios_on_user_id                 (user_id)
#  index_portfolios_on_user_id_and_created_at  (user_id,created_at)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

require 'test_helper'

class PortfolioTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end