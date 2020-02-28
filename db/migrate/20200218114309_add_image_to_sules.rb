class AddImageToSules < ActiveRecord::Migration[5.1]
  def change
    add_column :sules, :image, :string
  end
end
