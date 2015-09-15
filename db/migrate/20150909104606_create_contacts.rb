class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      # t.string :phone_array
      # t.string :whatsapp
      # t.string :skype
      # t.string :email
      # t.time :opening_hours
      # t.text :address
      t.text :description

      t.timestamps null: false
    end
  end
end
