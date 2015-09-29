class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.text :name
      t.text :description
      t.integer :is_folder
      t.integer :service_id


      t.timestamps null: false
    end
  end
end
