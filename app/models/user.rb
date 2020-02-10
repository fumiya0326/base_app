class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true, length:{maximum: 30}, uniqueness: true
                        
  has_many :commes
  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name: "Relationship",
                                  foreign_key: "follow_id",
                                  dependent:  :destroy
  has_many :following, through: :active_relationships, source: :follow
  has_many :followers, through: :passive_relationships, source: :follower
  
  def follo(other_user)
    following<< other_user
  end
  
  def unfollow(other_user)
    active_relationships.find_by(follow_id: other_user.id).destroy
  end
  
  def following?(other_user)
    following.include?(other_user)
  end
end
