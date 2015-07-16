# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'faker'

# Create Categories
 3.times do
   Category.create!(
     name:  Faker::Lorem.sentence,
   )
 end


# Create Articles
 10.times do
   Article.create!(
   title:  Faker::Lorem.sentence,
   content: Faker::Lorem.paragraph
   )
 end

 puts "Seed finished"
 puts "#{Category.count} Categories created"
  puts "#{Article.count} Articles created"