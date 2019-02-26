class RemoveNameAndUserStopNameFromFavorites < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites, :user_stop_name, :string
    remove_column :favorites, :name, :string
  end
end
