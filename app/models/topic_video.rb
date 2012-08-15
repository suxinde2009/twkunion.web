class TopicVideo
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :source
  field :widget
  field :cover
  field :url

  validates :title, :source, :cover, :widget, :topic_id, presence: true

  belongs_to :topic, index: true

  delegate :title, to: :topic, prefix: true
end
