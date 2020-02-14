class AddUserIdToBrowsingHistory < ActiveRecord::Migration[5.1]
  def change
    add_column :browsing_histories, :user_id, :integer
  end
end
