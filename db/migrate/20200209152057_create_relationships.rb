class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :follow_id
      
      t.timestamps
    end
    add_index :relationships, :follow_id
    add_index :relationships, :follower_id
    add_index :relationships, [:follow_id, :follower_id], unique: true
  end
end
