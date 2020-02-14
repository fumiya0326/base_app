class CommentHistory < ApplicationRecord
    belongs_to :user
    belongs_to :comme, optional: true
    belongs_to :reply, optional: true
end
