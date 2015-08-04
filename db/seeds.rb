# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create!(email: "rob@robcornishmusic.com", password: "12345678")
user.add_role :admin

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
