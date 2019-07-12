# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

def create_user(user)
    name = user['name']
    gender = user['gender']
    url_species = user['species'][0]
    json_species = open(url_species).read
    species = JSON.parse(json_species)['name']
    url_home = user['homeworld']
    json_home = open(url_home).read
    home = JSON.parse(json_home)['name']
    email = "#{name.gsub(/\s+/, '')}@#{home.gsub(/\s+/, '')}.com"
    result = {name: name, gender: gender, species: species, homeworld: home, email: email, password: "123456"}
    return result
end

def create_vehicle(item)
  name = item['name']
  model = item['model']
  manufacturer = item['manufacturer']
  crew = item['crew']
  passengers = item['passengers']
  details = "model: #{model}, manufacturer: #{manufacturer}, crew: #{crew}, passengers: #{passengers}"
  price = item['cost_in_credits'].to_i / 1000 == 0 ? 10 : item['cost_in_credits'].to_i / 1000
  category = "vehicle"
  result = {name: name, details: details, price: price, category: category}
  p result
  return result
end

def create_starship(item)
  name = item['name']
  model = item['model']
  manufacturer = item['manufacturer']
  crew = item['crew']
  passengers = item['passengers']
  details = "model: #{model}, manufacturer: #{manufacturer}, crew: #{crew}, passengers: #{passengers}"
  price = item['cost_in_credits'].to_i / 1000 == 0 ? 10 : item['cost_in_credits'].to_i / 1000
  category = "starship"
  result = {name: name, details: details, price: price, category: category}
  return result
end

def starships
  url = "https://swapi.co/api/starships/"
  json = open(url).read
  starships = JSON.parse(json)['results']
  starships.each do |item|
    starship = Item.new(create_starship(item))
    starship.user = User.first
    starship.save
  end
end

def vehicles
  url = "https://swapi.co/api/vehicles/"
  json = open(url).read
  vehicles = JSON.parse(json)['results']
  vehicles.each do |item|
    vehicle = Item.new(create_vehicle(item))
    vehicle.user = User.first
    vehicle.save
  end
end

def users
  url = "https://swapi.co/api/people/"
  json = open(url).read
  users = JSON.parse(json)['results']
  users.each do |user|
    User.create(create_user(user))
  end
end

Booking.destroy_all
Item.destroy_all
User.destroy_all
users
vehicles
starships

User.all.each do |user|
  case user.name
  when 'Luke Skywalker'
    user.remote_photo_url = 'https://res.cloudinary.com/djn5khfwt/image/upload/v1562775780/watto/users/users_luke_skywalker_cf0f7q.jpg'
    user.save
  when 'C-3PO'
    user.remote_photo_url = 'https://res.cloudinary.com/djn5khfwt/image/upload/v1562775801/watto/users/user_c3po_mm5std.jpg'
    user.save
  when 'R2-D2'
    user.remote_photo_url = 'https://res.cloudinary.com/djn5khfwt/image/upload/v1562775791/watto/users/users_r2d2_rvjvco.png'
    user.save
  when 'Darth Vader'
    user.remote_photo_url = 'https://res.cloudinary.com/djn5khfwt/image/upload/v1562776021/watto/users/user_darth_vader_e4agc1.jpg'
    user.save
  when 'Leia Organa'
    user.remote_photo_url = 'https://res.cloudinary.com/djn5khfwt/image/upload/v1562776297/watto/users/user_leia_organa_i9mxgu.jpg'
    user.save
  when 'Owen Lars'
    user.remote_photo_url = 'https://res.cloudinary.com/djn5khfwt/image/upload/v1562777783/watto/users/user_owen_lars_xeouua.jpg'
    user.save
  when 'Beru Whitesun lars'
    user.remote_photo_url = 'https://res.cloudinary.com/djn5khfwt/image/upload/v1562778233/watto/users/beru-lars-6_d0zr9o.jpg'
    user.save
  when 'R5-D4'
    user.remote_photo_url = 'https://res.cloudinary.com/djn5khfwt/image/upload/v1562778368/watto/users/user_r5-d4_hxqi03.jpg'
    user.save
  when 'Biggs Darklighter'
    user.remote_photo_url = 'https://res.cloudinary.com/djn5khfwt/image/upload/v1562778469/watto/users/user_Biggs_Darklighter_u3hscc.jpg'
    user.save
  when 'Obi-Wan Kenobi'
    user.remote_photo_url = 'https://res.cloudinary.com/djn5khfwt/image/upload/v1562833464/watto/users/user_obi_wan_kenobi_ksdy9o.png'
    user.save
  end
end

Item.all.each do |item|
  case item.name
  when 'TIE/LN starfighter'
    item.remote_photo_url = 'https://res.cloudinary.com/djn5khfwt/image/upload/v1562847476/watto/starships_tie_fighter_zhndsd.jpg'
    item.save
  when 'Snowspeeder'
    item.remote_photo_url = 'https://res.cloudinary.com/djn5khfwt/image/upload/v1562848781/watto/vehicles/vehicles_snow_speeder_fidiox.png'
    item.save
  when 'TIE bomber'
    item.remote_photo_url = 'https://res.cloudinary.com/djn5khfwt/image/upload/v1562847476/watto/starships_tie_fighter_zhndsd.jpg'
    item.save
  when 'AT-AT'
    item.remote_photo_url = 'https://res.cloudinary.com/djn5khfwt/image/upload/v1562848952/watto/vehicles/vehicles_at_at_ovjxcf.jpg'
    item.save
  when 'AT-ST'
    item.remote_photo_url = 'https://res.cloudinary.com/djn5khfwt/image/upload/v1562849012/watto/vehicles/vehicles_at_st_htes9l.png'
    item.save
  when 'Sand Crawler'
    item.remote_photo_url = 'https://res.cloudinary.com/djn5khfwt/image/upload/v1562848538/watto/vehicles/starships_sand_crawler_sdomm6.jpg'
    item.save
  when 'T-16 skyhopper'
    item.remote_photo_url = 'https://res.cloudinary.com/djn5khfwt/image/upload/v1562848350/watto/starships_naboo_royal_starship_utyxjs.jpg'
    item.save
  when 'X-34 landspeeder'
    item.remote_photo_url = 'https://res.cloudinary.com/djn5khfwt/image/upload/v1562771942/watto/vehicles/vehicle_landspeeder_tbqp9b.jpg'
    item.save
  when 'Storm IV Twin-Pod cloud car'
    item.remote_photo_url = 'https://res.cloudinary.com/djn5khfwt/image/upload/v1562857893/watto/vehicles/vehicles_storm_twin_pod_cloud_car_utpmfp.jpg'
    item.save
  when 'Sail barge'
    item.remote_photo_url = 'https://res.cloudinary.com/djn5khfwt/image/upload/v1562771942/watto/vehicles/vehicle_barge_df80s2.jpg'
    item.save
  when 'Executor'
    item.remote_photo_url = 'https://res.cloudinary.com/djn5khfwt/image/upload/v1562858038/watto/Executor_BF2_uz9hpc.png'
    item.save
  when 'Sentinel-class landing craft'
    item.remote_photo_url = 'https://res.cloudinary.com/djn5khfwt/image/upload/v1562847697/watto/star_ship_rebel_transport_ivqfew.jpg'
    item.save
  when 'Death Star'
    item.remote_photo_url = 'https://res.cloudinary.com/djn5khfwt/image/upload/v1562846741/watto/starships_death_star_yeevil.jpg'
    item.save
  when 'Millennium Falcon'
    item.remote_photo_url = 'https://res.cloudinary.com/djn5khfwt/image/upload/v1562846872/watto/starships_millenium_falcon_gbox6b.jpg'
    item.save
  when 'Y-wing'
    item.remote_photo_url = 'https://res.cloudinary.com/djn5khfwt/image/upload/v1562847030/watto/starships_y_wing_fp0fca.jpg'
    item.save
  when 'X-wing'
    item.remote_photo_url = 'https://res.cloudinary.com/djn5khfwt/image/upload/v1562847110/watto/starships_x_wing_cbd41t.jpg'
    item.save
  when 'TIE Advanced x1'
    item.remote_photo_url = 'https://res.cloudinary.com/djn5khfwt/image/upload/v1562847476/watto/starships_tie_fighter_zhndsd.jpg'
    item.save
  when 'Slave 1'
    item.remote_photo_url = 'https://res.cloudinary.com/djn5khfwt/image/upload/v1562858854/watto/Slave_I_DICE_viydms.png'
    item.save
  when 'Imperial shuttle'
    item.remote_photo_url = 'https://res.cloudinary.com/djn5khfwt/image/upload/v1562847874/watto/starships_imperial_shuttle_z3vfnf.jpg'
    item.save
  when 'EF76 Nebulon-B escort frigate'
    item.remote_photo_url = 'https://res.cloudinary.com/djn5khfwt/image/upload/v1562858993/watto/AotR_Nebulon-B__1_vmmum8.png'
    item.save
  end
end

