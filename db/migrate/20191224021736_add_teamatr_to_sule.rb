class AddTeamatrToSule < ActiveRecord::Migration[5.1]
  def change
    add_column :sules, :teamatr, :integer
  end
end
