class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :fio
      t.string :roles

      t.timestamps
    end
  end
end
