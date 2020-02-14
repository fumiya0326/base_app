class AddContentToSule < ActiveRecord::Migration[5.1]
  def change
    add_column :sules, :content, :text
  end
end
