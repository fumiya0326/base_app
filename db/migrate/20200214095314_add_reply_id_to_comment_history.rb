class AddReplyIdToCommentHistory < ActiveRecord::Migration[5.1]
  def change
    add_column :comment_histories, :reply_id, :integer
  end
end
