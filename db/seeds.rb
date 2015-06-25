# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Restaurant.destroy_all
restaurants = File.read("#{Rails.root}/restaurants.json")
JSON.parse(restaurants).each do |restaurant|
  Restaurant.create(name: restaurant['name'], 
                    website: restaurant['website'],
                    low_price: restaurant['price'][0],
                    high_price: restaurant['price'][1])
end

DailySchedule.destroy_all
restaurants = File.read("#{Rails.root}/restaurants.json")
JSON.parse(restaurants).each do |restaurant|
  restaurant['hours'].each do |day, values|
  schedule = DailySchedule.create(day: day,
                    open: day['open'],
                    close: day['closed'])
  assoc_restaurant = Restaurant.find_by(name: restaurant['name'])
  schedule.restaurant << assoc_restaurant
  end
end

User.destroy_all

password = "swordfish"

%w(devankestel fujimanuji greenlightening).each do |name|
  User.create(name: name, password: password)
end