class CreateDailySchedules < ActiveRecord::Migration
  def change
    create_table :daily_schedules do |t|
      t.string :day
      t.string :open
      t.string :close

      t.timestamps null: false
    end
  end
end
