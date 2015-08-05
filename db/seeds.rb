# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# user = User.create!(email: "rob@robcornishmusic.com", password: "12345678")
# user.add_role :admin

# 49.times do |n|
# 	# name = Faker::Name.name
# 	email = "u#{n+1}@robcornishmusic.com"
# 	password = "12345678"
# 	user = User.create!(email: email, password: password)
# 	# user.profile.create(name: )
# end

# #Relationships
# users = User.all
# user = users.first
# following = users[2..50]
# followers = users[3..40]
# following.each { |followed| user.follow(followed) }
# followers.each { |follower| follower.follow(user) }

goal = Goal.create([{ startdate: "2015-05-10 00:00:00", enddate: "2015-05-15 00:00:00", name: "Test" }, { startdate: "2015-05-20 00:00:00", enddate: "2015-05-25 00:00:00", name: "Test2" }, { startdate: "2015-06-10 00:00:00", enddate: "2015-06-15 00:00:00", name: "Test3" }, { startdate: "2015-07-10 00:00:00", enddate: "2015-07-15 00:00:00", name: "Test4" }, { startdate: "2015-07-12 00:00:00", enddate: "2015-05-17 00:00:00", name: "Test5" }])
