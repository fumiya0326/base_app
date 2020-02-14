class CreateReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :replies do |t|
      t.text :reply
      t.references :user, foreign_key: true
      t.references :comme, foreign_key: true
      t.references :sule, foreign_key: true

      t.timestamps
    end
  end
end
