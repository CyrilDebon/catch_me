class CreateLines < ActiveRecord::Migration[5.2]
  def change
    create_table :lines do |t|
      t.string :tbm_id
      t.string :name
      t.string :background
      t.string :text_color
      t.integer :kind
      t.string :code

      t.timestamps
    end
  end
end
