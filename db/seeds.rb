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
  price = item['cost_in_credits'].to_i / 1000
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
  price = item['cost_in_credits'].to_i / 1000
  category = "starship"
  result = {name: name, details: details, price: price, category: category}
  p result
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

Item.destroy_all
User.destroy_all
users
vehicles
starships
