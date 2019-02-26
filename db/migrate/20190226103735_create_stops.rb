class CreateStops < ActiveRecord::Migration[5.2]
  def change
    create_table :stops do |t|
      t.string :name
      t.string :tbm_id
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
