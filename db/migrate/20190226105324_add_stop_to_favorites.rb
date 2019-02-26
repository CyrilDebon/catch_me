class AddStopToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_reference :favorites, :stop, foreign_key: true
  end
end
