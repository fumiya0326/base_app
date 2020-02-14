class Sule < ApplicationRecord
    validates :name, length:{maximum: 20}, presence: true
    #validates :content, length:{maximum: 40}
    validates :teamatr, :numericality =>{
              :less_than_or_equal_to =>13
    },        presence: true
    has_many :commes
    has_many :replies
    has_many :browsing_histories
end
