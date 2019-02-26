class CreateDirections < ActiveRecord::Migration[5.2]
  def change
    create_table :directions do |t|
      t.string :name
      t.references :line, foreign_key: true
      t.references :stop, foreign_key: true

      t.timestamps
    end
  end
end
