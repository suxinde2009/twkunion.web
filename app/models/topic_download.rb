class TopicDownload
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :source_url

  validates :title, :source_url, presence: true

  belongs_to :topic
end
