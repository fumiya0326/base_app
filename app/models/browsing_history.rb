class BrowsingHistory < ApplicationRecord
    belongs_to :user
    belongs_to :sule
    validates :user_id, presence: true
    validates :sule_id, presence: true
end
