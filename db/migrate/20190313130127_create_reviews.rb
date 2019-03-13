class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :amelioration
      t.string :like
      t.string :body
      t.integer :frenquencies
      t.integer :recommendation

      t.timestamps
    end
  end
end
