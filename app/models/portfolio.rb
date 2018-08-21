# == Schema Information
#
# Table name: portfolios
#
#  id           :bigint(8)        not null, primary key
#  URL          :text
#  catcheye_img :string
#  description  :text
#  git_URL      :text
#  likes_count  :integer          default(0), not null
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
  has_many :likes,    dependent: :destroy
  has_many :iine_users, through: :likes, source: :user
  include FriendlyId
  before_create :set_uuid
  friendly_id :uuid
  mount_uploader :catcheye_img, ImageUploader
  validates :user_id, presence: true
  validates :title, presence:true, length: { maximum: 100 }
  validate :catcheye_size

  def iine(user)
    likes.create(user_id: user.id)
  end

  def uniine(user)
    likes.find_by(user_id: user.id).destroy
  end

  def iine?(user)
    iine_users.include?(user)
  end


  private

    def catcheye_size
      if catcheye_img.size > 5.megabytes
        errors.add(:catcheye_img, "画像ファイルは5MB以下にしてください")
      end
    end

    def set_uuid
      self.uuid = SecureRandom.hex(4)
    end
end
