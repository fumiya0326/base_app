class CreateCommentHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :comment_histories do |t|
      t.integer :user_id
      t.integer :comme_id

      t.timestamps
    end
  end
end
