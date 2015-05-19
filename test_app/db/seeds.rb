# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

start_time = DateTime.now.strftime('%Y-%m-%d 10:00')
end_time = DateTime.now.strftime('%Y-%m-%d 12:00')
Slot.find_or_create_by(post_code: '1111', start_time: start_time, end_time: end_time)

start_time = DateTime.now.strftime('%Y-%m-%d 15:00')
end_time = DateTime.now.strftime('%Y-%m-%d 17:00')
Slot.find_or_create_by(post_code: '1111', start_time: start_time, end_time: end_time)
