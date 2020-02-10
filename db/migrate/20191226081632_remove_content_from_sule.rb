class RemoveContentFromSule < ActiveRecord::Migration[5.1]
  def change
    remove_column :sules, :content, :text
  end
end
