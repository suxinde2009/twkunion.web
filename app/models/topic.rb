class Topic
  include Mongoid::Document
  include Mongoid::Timestamps
  include AutoIncrementSid
  include Recommendable

  field :title
  field :description
  field :rating, type: Integer, default: 0
  field :is_published, type: Boolean, default: false
  field :published_at, type: DateTime

  # counters
  field :posts_count, type: Integer, default: 0
  field :photos_count, type: Integer, default: 0
  field :videos_count, type: Integer, default: 0
  field :downloads_count, type: Integer, default: 0

  # photo columns
  field :logo
  field :banner

  mount_uploader :logo, PhotoUploader
  mount_uploader :banner, PhotoUploader

  validates :title, :description, presence: true

  has_many :topic_posts, dependent: :destroy
  has_many :topic_videos, dependent: :destroy
  has_many :topic_photos, dependent: :destroy
  has_many :topic_downloads, dependent: :destroy

  def publish!
    self.is_published = true
    self.published_at = Time.zone.now
    save(validate: false)
  end
end
