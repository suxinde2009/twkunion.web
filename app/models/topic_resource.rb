class TopicResource
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Symbolize
  include AutoIncrementSid

  field :title
  field :is_recommended, type: Boolean, default: false

  validates :title, :topic_id, presence: true

  belongs_to :topic, index: true

  delegate :title, to: :topic, prefix: true
end
