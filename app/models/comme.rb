class Comme < ApplicationRecord
    belongs_to :sule
    belongs_to :user, optional: true
    has_many :replies , dependent: :destroy
    has_many :comment_histories, dependent: :destroy
    validates :comment, presence: true, length:{maximum:200}
    mount_uploader :image, ImageUploader
    validate :image_size
    
    private
    def image_size
      if image.size > 5.megabytes
        errors.add(:picture, "5MB以下にしてください")
      end
    end
end
