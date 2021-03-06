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
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

class User < ApplicationRecord
  has_many :portfolios, dependent: :destroy
  has_many :comments,   dependent: :destroy
  has_many :likes,      dependent: :destroy
  include FriendlyId
  friendly_id :uuid
  mount_uploader :icon_img, ImageUploader
  before_save { email.downcase! }
  before_create :set_uuid
  validates :name, presence: true, length: { maximum: 10 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                                    format: { with: VALID_EMAIL_REGEX },
                                uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  THUMBNAIL_SIZE = [150, 150]
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end


  private

    def set_uuid
      self.uuid = SecureRandom.hex(5)
    end

end
