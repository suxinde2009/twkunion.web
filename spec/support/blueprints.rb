require 'machinist/mongoid'

User.blueprint do
  email     { Faker::Internet.email }
  username  { "uname_#{sn}" }
  name      { "name_#{sn}" }
  password  { "password" }
  confirmed_at  { Time.zone.now }
end

Message.blueprint do
  # Attributes here
end

Topic.blueprint do
  title { Faker::LoremCN.sentence }
  slug { "topic#{sn}" }
  description { Faker::LoremCN.paragraph }
  rating { rand(1..10) }
end

Article.blueprint do
  # Attributes here
end
TopicDownload.blueprint do
  # Attributes here
end

TopicPhoto.blueprint do
  # Attributes here
end

TopicVideo.blueprint do
  # Attributes here
end

Activity.blueprint do
  # Attributes here
end

Comment.blueprint do
  # Attributes here
end
