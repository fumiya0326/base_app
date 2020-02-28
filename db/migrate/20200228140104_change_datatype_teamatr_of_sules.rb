class ChangeDatatypeTeamatrOfSules < ActiveRecord::Migration[5.1]
  def change
     change_column :sules, :teamatr, :string
  end
end
