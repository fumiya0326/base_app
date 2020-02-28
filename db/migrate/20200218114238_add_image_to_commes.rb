class AddImageToCommes < ActiveRecord::Migration[5.1]
  def change
    add_column :commes, :image, :string
  end
end
