class FixDirectionFk < ActiveRecord::Migration[5.2]
  def change
    remove_column :directions, :stop_id
    add_reference :stops, :direction, foreign_key: true
  end
end
