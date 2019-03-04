class AddLocationToStops < ActiveRecord::Migration[5.2]
  def change
    add_column :stops, :location, :string
  end
end
