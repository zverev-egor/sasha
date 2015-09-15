class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :description
      t.string :login
      t.string :name
      t.integer :rating
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
