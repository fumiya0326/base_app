class Sule < ApplicationRecord
    validates :name, length:{maximum: 20}, presence: true
    #validates :content, length:{maximum: 40}
    validates :teamatr, presence: true, format:{with: /[Giants,Tigers,BayStars,Dragons,Swallows,Carp]/}
    validates :content, length:{maximum: 225}, presence: true
    has_many :commes
    has_many :replies
    has_many :browsing_histories
    mount_uploader :image, ImageUploader
    validate :image_size
    belongs_to :user

    def self.search(search)
        return Sule.all unless search
        Sule.where(["name LIKE? OR content LIKE?", "%#{search}%", "%#{search}%"])
    end
    
    private
    def image_size
      if image.size > 5.megabytes
        errors.add(:picture, "5MB以下にしてください")
      end
    end 
end
