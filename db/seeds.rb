# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

author = Author.create!(email: "sample@example.com", password: "password", password_confirmation: "password")
author1 = Author.create!(email: "user1@example.com", password: "password", password_confirmation: "password")

(1..30).each do |i|
  Post.create!( title: "test post #{i}", content: "test content #{i}", author: author )
end

(1..3).each do |i|
  Post.last.comments.create!(content: "test comment#{i}", author: author1)
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')