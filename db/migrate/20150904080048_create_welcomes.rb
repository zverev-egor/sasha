class CreateWelcomes < ActiveRecord::Migration
  def change
    create_table :welcomes do |t|
      t.text :description

      t.timestamps null: false
    end
  end
end
