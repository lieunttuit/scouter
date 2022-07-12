class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { maximum: 50 }
  validates :character, length: { maximum: 50 }
  validates :hobby, length: { maximum: 50 }
  validates :image, 
    content_type: [:png, :jpg, :jpeg, :heic],
    size: { less_than_or_equal_to: 5.megabytes }
  validates :sub_images, 
    content_type: [:png, :jpg, :jpeg, :heic],
    size: { less_than_or_equal_to: 5.megabytes }

  FILE_NUMBER_LIMIT = 3
  validate :validate_number_of_sub_images

  has_many :evaluations, dependent: :destroy
  has_one_attached :image
  has_many_attached :sub_images

  private

  def validate_number_of_sub_images
    return if sub_images.length <= FILE_NUMBER_LIMIT
    errors.add(:sub_images, "に添付できる画像は#{FILE_NUMBER_LIMIT}件までです。")
  end
end
