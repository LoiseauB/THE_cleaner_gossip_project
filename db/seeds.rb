
require 'faker'

#  CREATION OF CITIES --------------------------------------

10.times do
  City.create!(name: Faker::Games::Pokemon.location, zip_code: Faker::Address.zip_code)
end

#  CREATION OF USERS --------------------------------------

10.times do
  User.create!(first_name: Faker::Games::Heroes.name, last_name: Faker::FunnyName.name, city: City.all.sample, description: Faker::Movies::BackToTheFuture.quote, email: Faker::Internet.email, age: rand(15..65))
end

#  CREATION OF GOSSIPS --------------------------------------

 20.times do
  Gossip.create(title: Faker::Movie.title, content: Faker::TvShows::Simpsons.quote, user: User.all.sample)
end

#  CREATION OF TAGS --------------------------------------

10.times do
  Tag.create(title: "##{Faker::JapaneseMedia::DragonBall.planet}")
end

 #CREATION OF JOIN TABLES --------------------------------------

for i in 1..20
  rand(1..3).times do 
    JoinTableGossipTag.create(tag: Tag.all.sample, gossip_id: i)
  end
end

#  CREATION OF PRIVATE MESSAGES --------------------------------------

 
20.times do
  content_message = Faker::Games::StreetFighter.quote
  sender_message = User.all.sample
  rand(1..5).times do
    recipient_message = User.all.sample
    unless recipient_message == sender_message
      PrivateMessage.create(content: content_message, sender: sender_message, recipient: recipient_message)
    end
  end
end

# CREATION OF COMMENTS --------------------------------------

20.times do
  Comment.create(content: Faker::TvShows::SouthPark.quote, user: User.all.sample, gossip: Gossip.all.sample)
end

#  CREATION OF LIKES --------------------------------------

20.times do
  hazard = rand(1..2)
  if hazard == 1
    Like.create(user: User.all.sample, gossip: Gossip.all.sample)
  else
    Like.create(user: User.all.sample, comment: Comment.all.sample)
  end
end
