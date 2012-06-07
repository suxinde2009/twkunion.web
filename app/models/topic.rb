class Topic
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :slug
  field :description
  field :rating, type: Integer, default: 0
  field :is_published, type: Boolean, default: false
  field :published_at, type: DateTime

  # counters
  field :articles_count, type: Integer, default: 0
  field :photos_count, type: Integer, default: 0
  field :videos_count, type: Integer, default: 0
  field :downloads_count, type: Integer, default: 0

  # photo columns
  field :icon
  field :logo
  field :banner
  field :full_screen

  validates :title, :slug, :description, presence: true
  validates :slug, uniqueness: true

  has_many :topic_articles
  has_many :topic_videos
  has_many :topic_photos
  has_many :topic_downloads

  def publish!
    update_attributes(is_published: true, published_at: Time.zone.now)
  end
end
