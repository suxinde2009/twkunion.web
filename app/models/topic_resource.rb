class TopicResource
  include Mongoid::Document
  include Mongoid::Timestamps
  include AutoIncrementSid

  field :title

  validates :title, :topic_id, presence: true

  belongs_to :topic, index: true

  delegate :title, to: :topic, prefix: true
end
