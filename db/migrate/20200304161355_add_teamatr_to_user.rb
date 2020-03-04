class AddTeamatrToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :Teamatr, :string
  end
end
