class AddImageToReplies < ActiveRecord::Migration[5.1]
  def change
    add_column :replies, :image, :string
  end
end
