class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :neighborhood
      t.string :total_stars
      t.string :number_of_reviews
      t.string :price
      t.string :lat
      t.string :lng
      t.string :description

      t.timestamps

    end
  end
end
