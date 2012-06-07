class TopicVideo
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :source

  validates :title, :source, :topic_id, presence: true

  belongs_to :topic
end
