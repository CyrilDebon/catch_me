class AddPositionToLines < ActiveRecord::Migration[5.2]
  def change
    add_column :lines, :position, :integer
  end
end
