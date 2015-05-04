class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :body
      t.integer :rating
      t.references :user, index: true, foreign_key: true
      t.references :coffeeshop, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
