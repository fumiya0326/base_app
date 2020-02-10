class RemoveSuleIdFromCommes < ActiveRecord::Migration[5.1]
  def change
    remove_column :commes, :sule_id, :integer
  end
end
