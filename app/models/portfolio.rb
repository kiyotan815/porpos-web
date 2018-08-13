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
#  uuid         :string           not null
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

class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :catcheye_img, ImageUploader
  validates :user_id, presence: true
  validates :title, presence:true, length: { maximum: 100 }
  validate :catcheye_size

  private

    def catcheye_size
      if catcheye_img.size > 5.megabytes
        errors.add(:catcheye_img, "画像ファイルは5MB以下にしてください")
      end
    end
end
