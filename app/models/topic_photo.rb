class TopicPhoto
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :data

  validates :title, :data, presence: true

  belongs_to :topic
end
