class Comme < ApplicationRecord
    belongs_to :sule
    belongs_to :user, optional: true
    validates :comment, presence: true, length:{maximum:200}
end
