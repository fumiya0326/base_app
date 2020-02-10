class AddUserIdToComme < ActiveRecord::Migration[5.1]
  def change
    add_column :commes, :user_id, :integer
  end
end
