class AddSuleIdToBrowsingHistory < ActiveRecord::Migration[5.1]
  def change
    add_column :browsing_histories, :sule_id, :integer
  end
end
