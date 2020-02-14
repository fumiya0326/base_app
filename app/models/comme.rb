class Comme < ApplicationRecord
    belongs_to :sule
    belongs_to :user, optional: true, dependent: :destroy
    has_many :replies , dependent: :destroy
    validates :comment, presence: true, length:{maximum:200}
end
