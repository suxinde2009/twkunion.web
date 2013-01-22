class TopicDownload < TopicResource
  include Mongoid::MagicCounterCache

  field :source_url

  validates :source_url, presence: true

  # There will be a field 'posts_count' in post attributes
  counter_cache :topic, using: 'downloads'
end
