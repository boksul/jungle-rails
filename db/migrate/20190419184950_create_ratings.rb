class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :product_id
      t.integer :user_id
      t.text :description
      t.integer :rating
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps null: false
    end
  end
end
