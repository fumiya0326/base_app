class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :comme
  belongs_to :sule
  has_many :comment_histories
  validates :reply, length: {maximum:200}, presence: true
  validates :user_id, presence: true
  validates :sule_id, presence: true
  validates :comme_id, presence: true
end
