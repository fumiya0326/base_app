# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(username: "example",
             email: "example@example.com",
             password:              "foobar",
             password_confirmation: "foobar")
             
99.times do|n|
    username= Faker::Name.name
    email="example-#{n+1}@example.com"
    password="password"
    User.create!(username: username, 
                email: email,
                password: password,
                password_confirmation: password)
end
             
10.times do |n|
    name = "hello #{n+1}"
    team = n+1
    Sule.create!(name: name,
                 teamatr: team)
                
end

10.times do |n|
    comment= "hello"
    Comme.create!(comment: comment, 
                  sule_id: 1,
                  user_id: 2)
end

Comme.create!(comment: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
              sule_id: 1,
              user_id: 1)

users=User.all
user=User.first
following=users[2..50]
followers=users[3..40]
following.each{|follow| user.follo(follow)}
followers.each{|follower| follower.follo(user)}