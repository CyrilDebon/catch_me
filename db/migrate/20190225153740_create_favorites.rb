class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.string :name
      t.string :user_stop_name
      t.references :user, foreign_key: true
      t.integer :tbm_stop_id
      t.timestamps
    end
  end
end
