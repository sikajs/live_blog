# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

author = Author.create!(email: "sample@example.com", password: "password", password_confirmation: "password")

(1..30).each do |i|
  Post.create!( title: "test post #{i}", content: "test content #{i}", author: author )
end
