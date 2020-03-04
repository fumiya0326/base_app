class RemoveTeamatrFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :Teamatr, :string
  end
end
