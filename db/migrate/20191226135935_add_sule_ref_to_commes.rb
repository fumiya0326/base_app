class AddSuleRefToCommes < ActiveRecord::Migration[5.1]
  def change
    add_reference :commes, :sule, foreign_key: true
  end
end
