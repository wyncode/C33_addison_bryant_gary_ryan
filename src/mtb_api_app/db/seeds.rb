# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do
    user = User.new(
      name:   Faker::Name.unique.name,
      email:  Faker::Internet.email,
      password: "password",
      password_confirmation: "password"
    )
    user.save!
  end
  
  puts "#{User.count} users in the system..."
   
  markham = Trail.new(
      name: "Markham Park",
      lat: 26.134322,
      lon: -80.349492,
      light_rain_wait: 1,
      heavy_rain_wait: 4
  )
markham.save!
  quiet_waters = Trail.new(
      name: "Quiet Waters",
      lat: 26.309262,
      lon: -80.164765,
      light_rain_wait: 0,
      heavy_rain_wait: 2
  )
  quiet_waters.save!

  virginia_key = Trail.new(
      name: "Virginia Key",
      lat: 25.754014,
      lon: -80.150108,
      light_rain_wait: 0,
      heavy_rain_wait: 2
  )
  virginia_key.save!

  oleta = Trail.new(
      name: "Oleta River State Park",
      lat: 25.915719,
      lon: -80.135142,
      light_rain_wait: 0,
      heavy_rain_wait: 2
  )
  oleta.save!

  amelia = Trail.new(
      name: "Amelia Earhart Park",
      lat: 25.893048,
      lon: -80.280501,
      light_rain_wait: 2,
      heavy_rain_wait: 6
  )
  amelia.save!
  
  puts "#{Trail.count} trails in the system..."