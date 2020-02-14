class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :comme
  belongs_to :sule
  validates :reply, length: {maximum:200}, presence: true
  validates :user_id, presence: true
  validates :sule_id, presence: true
  validates :comme_id, presence: true
end
