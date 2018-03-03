class CreatePics < ActiveRecord::Migration
  def change
    create_table :pics do |t|
      t.integer :review_id
      t.string :image_url

      t.timestamps

    end
  end
end
