require 'machinist/mongoid'

User.blueprint do
  email     { Faker::Internet.email }
  username  { "uname_#{sn}" }
  name      { "name_#{sn}" }
  password  { "password" }
  confirmed_at  { Time.zone.now }
end

Topic.blueprint do
  title { Faker::LoremCN.sentence }
  slug { "topic#{sn}" }
  description { Faker::LoremCN.paragraph }
  rating { rand(1..10) }
  logo { "/assets/examples/02.jpg" }
end

TopicPost.blueprint do
  title { Faker::LoremCN.sentence }
  content { Faker::LoremCN.paragraphs(5).join('.') }
  category { (1..Settings.topic.article_categories.size).to_a.sample }
  author { "author_#{sn}" }
  source { "source_#{sn}" }
  topic { Topic.make! }
end

BbsPost.blueprint do
  title { Faker::LoremCN.sentence }
  content { Faker::LoremCN.paragraphs(5).join('.') }
  board { Board.make! }
end

TopicDownload.blueprint do
  # Attributes here
end

TopicPhoto.blueprint do
  title { Faker::LoremCN.sentence }
  data { Pathname.glob(Rails.root.join('lib/assets/images/*')).sample.open }
  topic { Topic.make! }
end

TopicVideo.blueprint do
  title { Faker::LoremCN.sentence }
  source { "source_#{sn}" }
  url { Faker::Internet.http_url }
  # cover { Pathname.glob(Rails.root.join('lib/assets/images/*')).sample.open }
  cover { "/assets/examples/02.jpg" }
  widget { '<embed src="http://www.tudou.com/v/sEZiugaHS9g/&resourceId=0_05_05_99/v.swf" type="application/x-shockwave-flash" allowscriptaccess="always" allowfullscreen="true" wmode="opaque" width="480" height="400"></embed>' }
  topic { Topic.make! }
end

Activity.blueprint do
  # Attributes here
end

Board.blueprint do
  name { Faker::LoremCN.word }
  # logo { Pathname.glob(Rails.root.join('lib/assets/images/*')).sample.open }
  logo { "/assets/examples/02.jpg" }
  description { Faker::LoremCN.paragraph }
end

Topic.blueprint do
  title { Faker::LoremCN.sentence }
  content { Faker::LoremCN.paragraphs(6).join(',') }
  user { Uesr.make! }
  board { Board.make! }
end

Reply.blueprint do
  # Attributes here
end

Asset.blueprint do
  # Attributes here
end

AssetPhoto.blueprint do
  # Attributes here
end
