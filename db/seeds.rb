# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


5.times do
    User.create(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: Faker::Internet.password(min_length: 6)
    )
end
  
tags = []
5.times do
    tags << Tag.create(name: Faker::Lorem.word)
end
  
users = User.all
10.times do
    user = users.sample
    post = user.posts.create(
      title: Faker::Lorem.sentence,
      content: Faker::Lorem.paragraph,
      published_at: Faker::Time.backward(days: 30),
      answers_count: rand(10),
      likes_count: rand(20)
    )
    post.tags << tags.sample(rand(1..3))
end


Post.delete_all
User.delete_all
