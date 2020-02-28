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
    name = Faker::Name.name
    team = ["Tigers","Giants", "BayStars", "Dragons", "Swallows","Carp"].sample
    content= Faker::Lorem.sentences
    Sule.create!(name: name,
                 teamatr: team,
                 content: content,
                 ikioi: 0)
                
end

20.times do |n|
    comment= Faker::Lorem.sentences
    sule= rand(10)
    user= rand(30)
    Comme.create!(comment: comment, 
                  sule_id: sule,
                  user_id: user
                 )
end

Comme.create!(comment: "古田 敦也（ふるた あつや、1965年8月6日 - ）は、兵庫県川西市出身の元プロ野球選手（捕手）・監督で、現在は野球解説者、タレント、スポーツキャスター。日本プロ野球名球会副理事長。芸能プロダクションは株式会社エーポイント所属。マネジメントは株式会社ビッグベンと業務提携。妻は元フジテレビアナウンサーの中井美穂。",
              sule_id: 1,
              user_id: 1,
              )

users=User.all
user=User.first
following=users[2..50]
followers=users[3..40]
following.each{|follow| user.follo(follow)}
followers.each{|follower| follower.follo(user)}