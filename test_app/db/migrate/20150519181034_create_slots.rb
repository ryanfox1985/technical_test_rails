class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.string :post_code
      t.timestamp :start_time
      t.timestamp :end_time

      t.timestamps null: false
    end
  end
end
