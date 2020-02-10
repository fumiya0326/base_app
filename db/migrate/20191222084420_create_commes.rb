class CreateCommes < ActiveRecord::Migration[5.1]
  def change
    create_table :commes do |t|
      t.string :comment
      t.integer :sule_id

      t.timestamps
    end
  end
end
