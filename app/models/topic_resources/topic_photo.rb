class TopicPhoto < TopicResource
  include Mongoid::MagicCounterCache

  field :title
  field :data

  mount_uploader :data, TopicPhotoUploader
  
  validates :data, presence: true

  # There will be a field 'posts_count' in post attributes
  counter_cache :topic, using: 'photos'
end
