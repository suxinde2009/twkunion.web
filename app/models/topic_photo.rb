class TopicPhoto
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :data

  validates :title, :data, :topic_id, presence: true

  belongs_to :topic

  mount_uploader :data, TopicPhotoUploader
end
