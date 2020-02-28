class ChangeDatatypeIkioiOfSules < ActiveRecord::Migration[5.1]
  def change
    change_column :sules, :ikioi, :float
  end
end
