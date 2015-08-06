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

goals = [{ startdate: "2015-05-10 00:00:00", enddate: "2015-05-15 00:00:00", name: "Test21", complete: "true", user_id: "1", completed_at: "2015-05-10 00:00:00" }, { startdate: "2015-05-20 00:00:00", enddate: "2015-05-25 00:00:00", name: "Test22", complete: "true", user_id: "1", completed_at: "2015-05-25 00:00:00" }, { startdate: "2015-06-10 00:00:00", enddate: "2015-06-15 00:00:00", name: "Test23", complete: "false", user_id: "1", completed_at: "2015-06-11 00:00:00" }, { startdate: "2015-07-10 00:00:00", enddate: "2015-07-15 00:00:00", name: "Test24", complete: "false", user_id: "1", completed_at: "2015-07-17 00:00:00" }, { startdate: "2015-07-12 00:00:00", enddate: "2015-05-17 00:00:00", name: "Test25", complete: "true", user_id: "1", completed_at: "2015-07-10 00:00:00" }]

goals.each do |goal|
	Goal.create!(goal)
end





