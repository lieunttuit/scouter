class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 4 }, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates :character, length: { maximum: 50 }
  validates :hobby, length: { maximum: 50 }
  validates :image, 
    # presence: true,
    content_type: [:png, :jpg, :jpeg, :heic],
    size: { less_than_or_equal_to: 5.megabytes }
    # dimension: { width: { max: 500 }, height: { max: 500 }}
  validates :sub_images, 
    content_type: [:png, :jpg, :jpeg, :heic],
    size: { less_than_or_equal_to: 5.megabytes }

  FILE_NUMBER_LIMIT = 3
  validate :validate_number_of_sub_images

  has_secure_password
  has_many :evaluations, dependent: :destroy
  has_one_attached :image
  has_many_attached :sub_images

  private

  def validate_number_of_sub_images
    return if sub_images.length <= FILE_NUMBER_LIMIT
    errors.add(:sub_images, "に添付できる画像は#{FILE_NUMBER_LIMIT}件までです。")
  end

end
