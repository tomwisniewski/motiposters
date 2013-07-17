# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create({:title => "Beard", :image => "moti1.jpg", :price => 57 })
Product.create({:title => "Zombies", :image => "moti2.jpg", :price => 102 })
Product.create({:title => "Good Things", :image => "moti3.jpg", :price => 12 })
Product.create({:title => "Who Cares?", :image => "moti4.jpg", :price => 36 })
Product.create({:title => "Super Dario", :image => "moti5.jpg", :price => 1000 })