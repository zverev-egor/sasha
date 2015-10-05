class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :fio
      t.string :number
      t.date :data
      t.time :time

      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
