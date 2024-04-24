# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Post.delete_all
User.delete_all
PostTag.delete_all


5.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = "password123"  
  User.create!(name: name, email: email, password: password)
end

tags = ["Ruby", "Rails", "Database", "Programming", "Web Development"]
tags.each do |tag|
  name = "#{tag} #{SecureRandom.hex(3)}" 
  Tag.create!(name: name)
end

User.all.each do |user|
  2.times do
    post = user.posts.create!(
      title: Faker::Lorem.sentence,
      content: Faker::Lorem.paragraph,
      answers_count: rand(0..10),
      likes_count: rand(0..100),
      tags: Tag.order("RANDOM()").limit(2)
    )
  end
end




