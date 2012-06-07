require 'machinist/mongoid'

User.blueprint do
  email     { Faker::Internet.email }
  username  { "uname_#{sn}" }
  name      { "name_#{sn}" }
  password  { "password" }
  confirmed_at  { Time.zone.now }
end

Authentication.blueprint do
  # Attributes here
end

Message.blueprint do
  # Attributes here
end

Topic.blueprint do
  # Attributes here
end

Article.blueprint do
  # Attributes here
end
