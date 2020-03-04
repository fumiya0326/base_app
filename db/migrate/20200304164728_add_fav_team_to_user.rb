class AddFavTeamToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :fav_team, :string
  end
end
