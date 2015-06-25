class CreateDailySchedules < ActiveRecord::Migration
  def change
    create_table :daily_schedules do |t|
      t.integer :restaurant_id
      t.string :day
      t.string :open
      t.string :close

      t.timestamps null: false
    end
  end
end
