class Topic
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :description
  field :rating, type: Integer, default: 0
  field :articles_count, type: Integer, default: 0

  # photo columns
  field :icon
  field :logo
  field :banner
  field :full_screen

  has_many :topic_articles
end
