class AddIkioiToSule < ActiveRecord::Migration[5.1]
  def change
    add_column :sules, :ikioi, :integer
  end
end
