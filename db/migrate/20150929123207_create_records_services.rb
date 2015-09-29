class CreateRecordsServices < ActiveRecord::Migration
  def change
    create_join_table :records, :services
  end
end

